From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] regulator: qcom-rpm: Rework for single device
Date: Fri, 27 Feb 2015 09:59:01 +0000
Message-ID: <54F03FE5.2090504@linaro.org>
References: <1424995217-23381-1-git-send-email-sboyd@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1424995217-23381-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>, Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Bjorn Andersson <bjorn@kryo.se>, Andy Gross <agross@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Brown <broonie@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


Thanks for the patch.

On 27/02/15 00:00, Stephen Boyd wrote:
> The RPM regulators are not individual devices. Creating platform
> devices for each regulator bloats the kernel's runtime memory
> footprint by ~12k. Let's rework this driver to be a single
> platform device for all the RPM regulators. This makes the
> DT match the schematic/datasheet closer too because now the
> regulators node contains a list of supplies at the package level
> for a particular PMIC model.
>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---

Tested-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Tested SATA, USB with the dt patches on top of mainline.

Mark/Stephen, Are you going to take this patch as fix into rc release? 
Depending on which I could rebase and send the DT patches for peripheral 
support on APQ8064.

--srini

>
> On 02/24, Bjorn Andersson wrote:
>> On Wed 18 Feb 18:29 PST 2015, Stephen Boyd wrote:
>>
>>> On 02/18/15 13:08, Bjorn Andersson wrote:
>>>> On Wed, Feb 18, 2015 at 12:28 PM, Stephen Boyd <sboyd@codeaurora.org> wrote:
>>
>> After taking a deeper look at this I've come to the following
>> conclusion:
>>
>> We can save 2100 bytes of data by spreading out the magic numbers from
>> the rpm resource tables into the regulator, clock and bus drivers. At
>> the cost of having this rpm-specific information spread out.
>>
>> Separate of that we could rewrite the entire regulator implementation to
>> define all regulators in platform specific tables in the regulators.
>> This would save about 12-15k of ram.
>
> Cool I started doing that.
>
>>
>> This can however be done in two ways:
>> 1) We modify the mfd driver to instatiate 3 mfd_cells; one of them
>> being "qcom,rpm-regulators". We modify the regulator driver to have
>> tables of the regulators for each platform and matching regulator
>> parameters by of_node name and registering these.
>>
>> 2) We stick with this binding, we then go ahead and do the same
>> modification to the mfd as above - passing the rpm of_node to the
>> regulator driver, that walks the children and match that to the current
>> compatible list. (in other words, we replace of_platform_populate with
>> our own mechamism).
>>
>>
>> The benefit of 2 is that we can use the code that was posted 10 months
>> ago and merged 3 months ago until someone prioritize those 12kb.
>
> I did (1) without modifying the MFD driver.
>
>>
>>
>> To take either of these paths the issue at the bottom has to be
>> resolved first.
>
> Right. I think that's resolved now.
>
>>
>>
>> More answers follows inline:
>>
>>>
>>> We're already maintaining these tables in qcom-rpm.c. I'm advocating for
>>> removing those tables from the rpm driver and putting the data into the
>>> regulator driver. Then we don't have to index into a sparse table to
>>> figure out what values the RPM wants to use. Instead we have the data at
>>> hand for a particular regulator based on the of_regulator_match.
>>>
>>
>> I do like the "separation of concerns" between the rpm driver and the
>> children, but you're right in that we're wasting almost 3kb in doing so:
>>
>> (gdb) p sizeof(apq8064_rpm_resource_table) + sizeof(msm8660_rpm_resource_table) + sizeof(msm8960_rpm_resource_table)
>> $2 = 6384
>>
>> vs
>>
>> (gdb) p sizeof(struct qcom_rpm_resource) * (77 + 74 + 73)
>> $3 = 3584
>>
>> The alternative would be to spread those magic constants out in the
>> three client drivers.
>>
>> Looking at this from a software design perspective I stand by the
>> argument that the register layout of the rpm is not a regulator driver
>> implementation detail and is better kept separate.
>>
>> As we decided to define the regulators in code but the actual
>> composition in dt it was not possible to put the individual numbers in
>> DT. Having reg = <165 68 48> does not make any sense, unless we perhaps
>> maintain said table in the dt binding documentation.
>
> For now I've left it so that the #define is used in C code.
>
>>
>>>  From what I can tell, that data is split in two places. The regulator
>>> type knows how big the data we want to send is (1 or 2) and that is
>>> checked in the RPM driver to make sure that the two agree (this part
>>> looks like over-defensive coding).
>>
>> Yeah, after debugging production code for years I like to be slightly on
>> the defensive side. But the size could of course be dropped from the
>> resource-tables; reducing the savings of your suggestion by another 800
>> bytes...
>
> Sounds good. We should probably do it.
>
>>
>>> Then the DT has a made up number that
>>> maps to 3 different numbers in the RPM driver.
>>
>> Reading the following snippet in my dts file makes imidiate sense:
>>
>> reg = <QCOM_RPM_PM8921_SMPS1>
>>
>> the following doesn't make any sense:
>>
>> reg = <116 31 30>;
>>
>> Maybe it's write-once in a dts so it doesn't matter that much - as long
>> as the node is descriptive. But I like the properties to be human
>> understandable.
>
> Wouldn't a
>
>   #define QCOM_RPM_PM8921_SMPS1 116 31 30
>
> suffice? That looks to be the same readability.
>
>>
>>> If the RPM was moving these offsets
>>> around within the same compatible string it would make sense to put that
>>> in DT and figure out dynamically what the offsets are because they
>>> really can be different.
>>
>> The proposed binding states the following:
>>
>> - compatible:
>>          Usage: required
>>          Value type: <string>
>>          Definition: must be one of:
>>                      "qcom,rpm-pm8058-smps"
>>                      "qcom,rpm-pm8901-ftsmps"
>>                      "qcom,rpm-pm8921-smps"
>>                      "qcom,rpm-pm8921-ftsmps"
>>
>> Doesn't this map to the case you say make sense?
>
> I mean the compatible for the entire RPM/regulators node (i.e. qcom,rpm-msm8960
> or qcom,rpm-apq8064). Not each individual regulator, which IMO shouldn't need a compatible at all.
>
>>
>>>>
>>>> Non the less, we must provide this information to the regulator
>>>> framework in some way if we want its help.
>>>> If we define all regulators in code (and just bring their properties
>>>> from DT) then we could encapsulate the relationship there as well.
>>>> But with the current suggested solution of having all this data coming
>>>> from DT I simply rely on the existing infrastructure for describing
>>>> supply-dependencies in DT.
>>>>
>>>>
>>>
>>> Yes I don't see how putting the data in C or in DT or having a
>>> regulators encapsulating node makes it impossible to specify the supply.
>>>
>>
>> Me neither, a month ago...
>>
>> Here's the discussion we had with Mark regarding having the regulator
>> core pick up -supply properties from the individual child of_nodes of a
>> regulator driver:
>>
>> https://lkml.org/lkml/2015/2/4/759
>>
>> As far as I can see this has to be fixed for us to move over to having
>> one driver registering all our regulators, independently of how we
>> structure this binding.
>>
>
> Mark is saying that the entire PMIC (e.g. PM8921) is the package. On the
> package there are pins like VIN_L27, VIN_L24, etc (look at a schematic). When
> you consider the regulators node (compatible = "qcom,rpm-pm8921-regulators")
> is the package then you can see that it should have a handful of vin_*-supply
> properties that correspond to what you see in the schematic and the datasheet.
> This way if a board designer has decided to run a particular supply to
> VIN_L1_L2_L12_L18 they just wire it up in DT and everything works. They don't
> have to look at the binding for the L1, L2, L12, and L18 regulators and figure
> out that it uses vin-supply for the supply. Plus everything matches what
> they see in the schematic and datasheets.
>
> Note: This patch is not complete. We still need to fill out the other pmics
> and standalone regulators (smb208) that this driver is for.
>
>   drivers/regulator/qcom_rpm-regulator.c | 484 ++++++++++++++++++++++++++++-----
>   1 file changed, 416 insertions(+), 68 deletions(-)
>
> diff --git a/drivers/regulator/qcom_rpm-regulator.c b/drivers/regulator/qcom_rpm-regulator.c
> index 00c5cc3d9546..538733bb7e8b 100644
> --- a/drivers/regulator/qcom_rpm-regulator.c
> +++ b/drivers/regulator/qcom_rpm-regulator.c
> @@ -581,27 +581,347 @@ static const struct qcom_rpm_reg smb208_smps = {
>   	.supports_force_mode_bypass = false,
>   };
>
> +struct qcom_rpm_reg_desc {
> +	const struct qcom_rpm_reg *template;
> +	int resource;
> +	const char *supply;
> +};
> +
> +struct qcom_rpm_of_match {
> +	struct of_regulator_match *of_match;
> +	unsigned int size;
> +};
> +
> +#define DEFINE_QCOM_RPM_OF_MATCH(t)		\
> +	struct qcom_rpm_of_match t##_m = {	\
> +		.of_match = (t), 		\
> +		.size = ARRAY_SIZE(t), 		\
> +	}
> +
> +static struct of_regulator_match pm8921_regs[] = {
> +	{
> +		.name = "s1",
> +		.driver_data = &(struct qcom_rpm_reg_desc){
> +			.template = &pm8921_smps,
> +			.resource = QCOM_RPM_PM8921_SMPS1,
> +		},
> +	},
> +	{
> +		.name = "s2",
> +		.driver_data = &(struct qcom_rpm_reg_desc) {
> +			.template = &pm8921_smps,
> +			.resource = QCOM_RPM_PM8921_SMPS2,
> +		},
> +	},
> +	{
> +		.name = "s3",
> +		.driver_data = &(struct qcom_rpm_reg_desc) {
> +			.template = &pm8921_smps,
> +			.resource = QCOM_RPM_PM8921_SMPS3,
> +		},
> +	},
> +	{
> +		.name = "s4",
> +		.driver_data = &(struct qcom_rpm_reg_desc) {
> +			.template = &pm8921_smps,
> +			.resource = QCOM_RPM_PM8921_SMPS4,
> +		},
> +	},
> +	{
> +		.name = "s7",
> +		.driver_data = &(struct qcom_rpm_reg_desc) {
> +			.template = &pm8921_smps,
> +			.resource = QCOM_RPM_PM8921_SMPS7,
> +		},
> +	},
> +	{
> +		.name = "s8",
> +		.driver_data = &(struct qcom_rpm_reg_desc) {
> +			.template = &pm8921_smps,
> +			.resource = QCOM_RPM_PM8921_SMPS8,
> +		},
> +	},
> +	{
> +		.name = "l1",
> +		.driver_data = &(struct qcom_rpm_reg_desc) {
> +			.template = &pm8921_nldo,
> +			.resource = QCOM_RPM_PM8921_LDO1,
> +			.supply = "vin_l1_l2_l12_l18",
> +		},
> +	},
> +	{
> +		.name = "l2",
> +		.driver_data = &(struct qcom_rpm_reg_desc) {
> +			.template = &pm8921_nldo,
> +			.resource = QCOM_RPM_PM8921_LDO2,
> +			.supply = "vin_l1_l2_l12_l18",
> +		},
> +	},
> +	{
> +		.name = "l3",
> +		.driver_data = &(struct qcom_rpm_reg_desc) {
> +			.template = &pm8921_pldo,
> +			.resource = QCOM_RPM_PM8921_LDO3,
> +		},
> +	},
> +	{
> +		.name = "l4",
> +		.driver_data = &(struct qcom_rpm_reg_desc) {
> +			.template = &pm8921_pldo,
> +			.resource = QCOM_RPM_PM8921_LDO4,
> +		},
> +	},
> +	{
> +		.name = "l5",
> +		.driver_data = &(struct qcom_rpm_reg_desc) {
> +			.template = &pm8921_pldo,
> +			.resource = QCOM_RPM_PM8921_LDO5,
> +		},
> +	},
> +	{
> +		.name = "l6",
> +		.driver_data = &(struct qcom_rpm_reg_desc) {
> +			.template = &pm8921_pldo,
> +			.resource = QCOM_RPM_PM8921_LDO6,
> +		},
> +	},
> +	{
> +		.name = "l7",
> +		.driver_data = &(struct qcom_rpm_reg_desc) {
> +			.template = &pm8921_pldo,
> +			.resource = QCOM_RPM_PM8921_LDO7,
> +		},
> +	},
> +	{
> +		.name = "l8",
> +		.driver_data = &(struct qcom_rpm_reg_desc) {
> +			.template = &pm8921_pldo,
> +			.resource = QCOM_RPM_PM8921_LDO8,
> +		},
> +	},
> +	{
> +		.name = "l9",
> +		.driver_data = &(struct qcom_rpm_reg_desc) {
> +			.template = &pm8921_pldo,
> +			.resource = QCOM_RPM_PM8921_LDO9,
> +		},
> +	},
> +	{
> +		.name = "l10",
> +		.driver_data = &(struct qcom_rpm_reg_desc) {
> +			.template = &pm8921_pldo,
> +			.resource = QCOM_RPM_PM8921_LDO10,
> +		},
> +	},
> +	{
> +		.name = "l11",
> +		.driver_data = &(struct qcom_rpm_reg_desc) {
> +			.template = &pm8921_pldo,
> +			.resource = QCOM_RPM_PM8921_LDO11,
> +		},
> +	},
> +	{
> +		.name = "l12",
> +		.driver_data = &(struct qcom_rpm_reg_desc) {
> +			.template = &pm8921_nldo,
> +			.resource = QCOM_RPM_PM8921_LDO12,
> +			.supply = "vin_l1_l2_l12_l18",
> +		},
> +	},
> +	{
> +		.name = "l13",
> +		.driver_data = &(struct qcom_rpm_reg_desc) {
> +			.template = &pm8921_pldo,
> +			.resource = QCOM_RPM_PM8921_LDO13,
> +		},
> +	},
> +	{
> +		.name = "l14",
> +		.driver_data = &(struct qcom_rpm_reg_desc) {
> +			.template = &pm8921_pldo,
> +			.resource = QCOM_RPM_PM8921_LDO14,
> +		},
> +	},
> +	{
> +		.name = "l15",
> +		.driver_data = &(struct qcom_rpm_reg_desc) {
> +			.template = &pm8921_pldo,
> +			.resource = QCOM_RPM_PM8921_LDO15,
> +		},
> +	},
> +	{
> +		.name = "l16",
> +		.driver_data = &(struct qcom_rpm_reg_desc) {
> +			.template = &pm8921_pldo,
> +			.resource = QCOM_RPM_PM8921_LDO16,
> +		},
> +	},
> +	{
> +		.name = "l17",
> +		.driver_data = &(struct qcom_rpm_reg_desc) {
> +			.template = &pm8921_pldo,
> +			.resource = QCOM_RPM_PM8921_LDO17,
> +		},
> +	},
> +	{
> +		.name = "l18",
> +		.driver_data = &(struct qcom_rpm_reg_desc) {
> +			.template = &pm8921_nldo,
> +			.resource = QCOM_RPM_PM8921_LDO18,
> +			.supply = "vin_l1_l2_l12_l18",
> +		},
> +	},
> +	{
> +		.name = "l21",
> +		.driver_data = &(struct qcom_rpm_reg_desc) {
> +			.template = &pm8921_pldo,
> +			.resource = QCOM_RPM_PM8921_LDO21,
> +		},
> +	},
> +	{
> +		.name = "l22",
> +		.driver_data = &(struct qcom_rpm_reg_desc) {
> +			.template = &pm8921_pldo,
> +			.resource = QCOM_RPM_PM8921_LDO22,
> +		},
> +	},
> +	{
> +		.name = "l23",
> +		.driver_data = &(struct qcom_rpm_reg_desc) {
> +			.template = &pm8921_pldo,
> +			.resource = QCOM_RPM_PM8921_LDO23,
> +		},
> +	},
> +	{
> +		.name = "l24",
> +		.driver_data = &(struct qcom_rpm_reg_desc) {
> +			.template = &pm8921_nldo1200,
> +			.resource = QCOM_RPM_PM8921_LDO24,
> +			.supply = "vin_l24",
> +		},
> +	},
> +	{
> +		.name = "l25",
> +		.driver_data = &(struct qcom_rpm_reg_desc) {
> +			.template = &pm8921_nldo1200,
> +			.resource = QCOM_RPM_PM8921_LDO25,
> +			.supply = "vin_l25",
> +		},
> +	},
> +	{
> +		.name = "l26",
> +		.driver_data = &(struct qcom_rpm_reg_desc) {
> +			.template = &pm8921_nldo1200,
> +			.resource = QCOM_RPM_PM8921_LDO26,
> +		},
> +	},
> +	{
> +		.name = "l27",
> +		.driver_data = &(struct qcom_rpm_reg_desc) {
> +			.template = &pm8921_nldo1200,
> +			.resource = QCOM_RPM_PM8921_LDO27,
> +			.supply = "vin_l27",
> +		},
> +	},
> +	{
> +		.name = "l28",
> +		.driver_data = &(struct qcom_rpm_reg_desc) {
> +			.template = &pm8921_nldo1200,
> +			.resource = QCOM_RPM_PM8921_LDO28,
> +			.supply = "vin_l28",
> +		},
> +	},
> +	{
> +		.name = "l29",
> +		.driver_data = &(struct qcom_rpm_reg_desc) {
> +			.template = &pm8921_pldo,
> +			.resource = QCOM_RPM_PM8921_LDO29
> +		},
> +	},
> +	{
> +		.name = "lvs1",
> +		.driver_data = &(struct qcom_rpm_reg_desc) {
> +			.template = &pm8921_switch,
> +			.resource = QCOM_RPM_PM8921_LVS1,
> +			.supply = "vin_lvs_1_3_6",
> +		},
> +	},
> +	{
> +		.name = "lvs2",
> +		.driver_data = &(struct qcom_rpm_reg_desc) {
> +			.template = &pm8921_switch,
> +			.resource = QCOM_RPM_PM8921_LVS2,
> +			.supply = "vin_lvs2",
> +		},
> +	},
> +	{
> +		.name = "lvs3",
> +		.driver_data = &(struct qcom_rpm_reg_desc) {
> +			.template = &pm8921_switch,
> +			.resource = QCOM_RPM_PM8921_LVS3,
> +			.supply = "vin_lvs_1_3_6",
> +		},
> +	},
> +	{
> +		.name = "lvs4",
> +		.driver_data = &(struct qcom_rpm_reg_desc) {
> +			.template = &pm8921_switch,
> +			.resource = QCOM_RPM_PM8921_LVS4,
> +			.supply = "vin_lvs_4_5_7",
> +		},
> +	},
> +	{
> +		.name = "lvs5",
> +		.driver_data = &(struct qcom_rpm_reg_desc) {
> +			.template = &pm8921_switch,
> +			.resource = QCOM_RPM_PM8921_LVS5,
> +			.supply = "vin_lvs_4_5_7",
> +		},
> +	},
> +	{
> +		.name = "lvs6",
> +		.driver_data = &(struct qcom_rpm_reg_desc) {
> +			.template = &pm8921_switch,
> +			.resource = QCOM_RPM_PM8921_LVS6,
> +			.supply = "vin_lvs_1_3_6",
> +		},
> +	},
> +	{
> +		.name = "lvs7",
> +		.driver_data = &(struct qcom_rpm_reg_desc) {
> +			.template = &pm8921_switch,
> +			.resource = QCOM_RPM_PM8921_LVS7,
> +			.supply = "vin_lvs_4_5_7",
> +		},
> +	},
> +	{
> +		.name = "usb-switch",
> +		.driver_data = &(struct qcom_rpm_reg_desc) {
> +			.template = &pm8921_switch,
> +			.resource = QCOM_RPM_USB_OTG_SWITCH,
> +		},
> +	},
> +	{
> +		.name = "hdmi-switch",
> +		.driver_data = &(struct qcom_rpm_reg_desc) {
> +			.template = &pm8921_switch,
> +			.resource = QCOM_RPM_HDMI_SWITCH,
> +		},
> +	},
> +	{
> +		.name = "ncp",
> +		.driver_data = &(struct qcom_rpm_reg_desc) {
> +			.template = &pm8921_ncp,
> +			.resource = QCOM_RPM_PM8921_NCP,
> +			.supply = "vin_ncp",
> +		},
> +	},
> +};
> +
> +static DEFINE_QCOM_RPM_OF_MATCH(pm8921_regs);
> +
>   static const struct of_device_id rpm_of_match[] = {
> -	{ .compatible = "qcom,rpm-pm8058-pldo",     .data = &pm8058_pldo },
> -	{ .compatible = "qcom,rpm-pm8058-nldo",     .data = &pm8058_nldo },
> -	{ .compatible = "qcom,rpm-pm8058-smps",     .data = &pm8058_smps },
> -	{ .compatible = "qcom,rpm-pm8058-ncp",      .data = &pm8058_ncp },
> -	{ .compatible = "qcom,rpm-pm8058-switch",   .data = &pm8058_switch },
> -
> -	{ .compatible = "qcom,rpm-pm8901-pldo",     .data = &pm8901_pldo },
> -	{ .compatible = "qcom,rpm-pm8901-nldo",     .data = &pm8901_nldo },
> -	{ .compatible = "qcom,rpm-pm8901-ftsmps",   .data = &pm8901_ftsmps },
> -	{ .compatible = "qcom,rpm-pm8901-switch",   .data = &pm8901_switch },
> -
> -	{ .compatible = "qcom,rpm-pm8921-pldo",     .data = &pm8921_pldo },
> -	{ .compatible = "qcom,rpm-pm8921-nldo",     .data = &pm8921_nldo },
> -	{ .compatible = "qcom,rpm-pm8921-nldo1200", .data = &pm8921_nldo1200 },
> -	{ .compatible = "qcom,rpm-pm8921-smps",     .data = &pm8921_smps },
> -	{ .compatible = "qcom,rpm-pm8921-ftsmps",   .data = &pm8921_ftsmps },
> -	{ .compatible = "qcom,rpm-pm8921-ncp",      .data = &pm8921_ncp },
> -	{ .compatible = "qcom,rpm-pm8921-switch",   .data = &pm8921_switch },
> -
> -	{ .compatible = "qcom,rpm-smb208", .data = &smb208_smps },
> +	{ .compatible = "qcom,rpm-pm8921-regulators", .data = &pm8921_regs_m },
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(of, rpm_of_match);
> @@ -619,7 +939,8 @@ static int rpm_reg_set(struct qcom_rpm_reg *vreg,
>   	return 0;
>   }
>
> -static int rpm_reg_of_parse_freq(struct device *dev, struct qcom_rpm_reg *vreg)
> +static int rpm_reg_of_parse_freq(struct device *dev, struct qcom_rpm_reg *vreg,
> +		struct device_node *of_node)
>   {
>   	static const int freq_table[] = {
>   		19200000, 9600000, 6400000, 4800000, 3840000, 3200000, 2740000,
> @@ -633,9 +954,10 @@ static int rpm_reg_of_parse_freq(struct device *dev, struct qcom_rpm_reg *vreg)
>   	int i;
>
>   	key = "qcom,switch-mode-frequency";
> -	ret = of_property_read_u32(dev->of_node, key, &freq);
> +	ret = of_property_read_u32(of_node, key, &freq);
>   	if (ret) {
> -		dev_err(dev, "regulator requires %s property\n", key);
> +		dev_err(dev, "regulator %s requires %s property\n",
> +				vreg->desc.name, key);
>   		return -EINVAL;
>   	}
>
> @@ -646,88 +968,74 @@ static int rpm_reg_of_parse_freq(struct device *dev, struct qcom_rpm_reg *vreg)
>   		}
>   	}
>
> -	dev_err(dev, "invalid frequency %d\n", freq);
> +	dev_err(dev, "regulator %s has invalid frequency %d\n", vreg->desc.name,
> +			freq);
>   	return -EINVAL;
>   }
>
> -static int rpm_reg_probe(struct platform_device *pdev)
> +static int rpm_regulator_register(struct platform_device *pdev,
> +				  struct of_regulator_match *match,
> +				  struct qcom_rpm *rpm)
>   {
> +	struct qcom_rpm_reg_desc *rpm_desc = match->driver_data;
>   	struct regulator_init_data *initdata;
> -	const struct qcom_rpm_reg *template;
> -	const struct of_device_id *match;
>   	struct regulator_config config = { };
>   	struct regulator_dev *rdev;
>   	struct qcom_rpm_reg *vreg;
> +	struct device_node *of_node = match->of_node;
>   	const char *key;
>   	u32 force_mode;
>   	bool pwm;
>   	u32 val;
>   	int ret;
>
> -	match = of_match_device(rpm_of_match, &pdev->dev);
> -	template = match->data;
> -
>   	vreg = devm_kmalloc(&pdev->dev, sizeof(*vreg), GFP_KERNEL);
> -	if (!vreg) {
> -		dev_err(&pdev->dev, "failed to allocate vreg\n");
> +	if (!vreg)
>   		return -ENOMEM;
> -	}
> -	memcpy(vreg, template, sizeof(*vreg));
> +
> +	memcpy(vreg, rpm_desc->template, sizeof(*vreg));
>   	mutex_init(&vreg->lock);
>   	vreg->dev = &pdev->dev;
>   	vreg->desc.id = -1;
>   	vreg->desc.owner = THIS_MODULE;
>   	vreg->desc.type = REGULATOR_VOLTAGE;
> -	vreg->desc.name = pdev->dev.of_node->name;
> -	vreg->desc.supply_name = "vin";
> -
> +	vreg->desc.name = of_node->name;
> +	vreg->desc.supply_name = rpm_desc->supply;
>   	vreg->rpm = dev_get_drvdata(pdev->dev.parent);
> -	if (!vreg->rpm) {
> -		dev_err(&pdev->dev, "unable to retrieve handle to rpm\n");
> -		return -ENODEV;
> -	}
> -
> -	initdata = of_get_regulator_init_data(&pdev->dev, pdev->dev.of_node,
> -					      &vreg->desc);
> -	if (!initdata)
> -		return -EINVAL;
> -
> -	key = "reg";
> -	ret = of_property_read_u32(pdev->dev.of_node, key, &val);
> -	if (ret) {
> -		dev_err(&pdev->dev, "failed to read %s\n", key);
> -		return ret;
> -	}
> -	vreg->resource = val;
> +	vreg->resource = rpm_desc->resource;
> +	initdata = match->init_data;
>
>   	if ((vreg->parts->uV.mask || vreg->parts->mV.mask) &&
>   	    (!initdata->constraints.min_uV || !initdata->constraints.max_uV)) {
> -		dev_err(&pdev->dev, "no voltage specified for regulator\n");
> +		dev_err(&pdev->dev, "no voltage specified for regulator %s\n",
> +				vreg->desc.name);
>   		return -EINVAL;
>   	}
>
>   	key = "bias-pull-down";
> -	if (of_property_read_bool(pdev->dev.of_node, key)) {
> +	if (of_property_read_bool(of_node, key)) {
>   		ret = rpm_reg_set(vreg, &vreg->parts->pd, 1);
>   		if (ret) {
> -			dev_err(&pdev->dev, "%s is invalid", key);
> +			dev_err(&pdev->dev, "%s is invalid (%s)", key,
> +					vreg->desc.name);
>   			return ret;
>   		}
>   	}
>
>   	if (vreg->parts->freq.mask) {
> -		ret = rpm_reg_of_parse_freq(&pdev->dev, vreg);
> +		ret = rpm_reg_of_parse_freq(&pdev->dev, vreg, of_node);
>   		if (ret < 0)
>   			return ret;
>   	}
>
>   	if (vreg->parts->pm.mask) {
>   		key = "qcom,power-mode-hysteretic";
> -		pwm = !of_property_read_bool(pdev->dev.of_node, key);
> +		pwm = !of_property_read_bool(of_node, key);
>
>   		ret = rpm_reg_set(vreg, &vreg->parts->pm, pwm);
>   		if (ret) {
> -			dev_err(&pdev->dev, "failed to set power mode\n");
> +			dev_err(&pdev->dev, "failed to set power mode (%s)\n",
> +					vreg->desc.name);
>   			return ret;
>   		}
>   	}
> @@ -736,11 +1044,12 @@ static int rpm_reg_probe(struct platform_device *pdev)
>   		force_mode = -1;
>
>   		key = "qcom,force-mode";
> -		ret = of_property_read_u32(pdev->dev.of_node, key, &val);
> +		ret = of_property_read_u32(of_node, key, &val);
>   		if (ret == -EINVAL) {
>   			val = QCOM_RPM_FORCE_MODE_NONE;
>   		} else if (ret < 0) {
> -			dev_err(&pdev->dev, "failed to read %s\n", key);
> +			dev_err(&pdev->dev, "failed to read %s (%s)\n", key,
> +					vreg->desc.name);
>   			return ret;
>   		}
>
> @@ -775,13 +1084,15 @@ static int rpm_reg_probe(struct platform_device *pdev)
>   		}
>
>   		if (force_mode == -1) {
> -			dev_err(&pdev->dev, "invalid force mode\n");
> +			dev_err(&pdev->dev, "invalid force mode (%s)\n",
> +					vreg->desc.name);
>   			return -EINVAL;
>   		}
>
>   		ret = rpm_reg_set(vreg, &vreg->parts->fm, force_mode);
>   		if (ret) {
> -			dev_err(&pdev->dev, "failed to set force mode\n");
> +			dev_err(&pdev->dev, "failed to set force mode (%s)\n",
> +					vreg->desc.name);
>   			return ret;
>   		}
>   	}
> @@ -789,11 +1100,48 @@ static int rpm_reg_probe(struct platform_device *pdev)
>   	config.dev = &pdev->dev;
>   	config.init_data = initdata;
>   	config.driver_data = vreg;
> -	config.of_node = pdev->dev.of_node;
> +	config.of_node = of_node;
> +
>   	rdev = devm_regulator_register(&pdev->dev, &vreg->desc, &config);
> -	if (IS_ERR(rdev)) {
> -		dev_err(&pdev->dev, "can't register regulator\n");
> -		return PTR_ERR(rdev);
> +
> +	return PTR_ERR_OR_ZERO(rdev);
> +}
> +
> +static int rpm_reg_probe(struct platform_device *pdev)
> +{
> +	const struct of_device_id *match;
> +	const struct qcom_rpm_of_match *rpm_match;
> +	struct of_regulator_match *of_match;
> +	struct qcom_rpm *rpm;
> +	int ret;
> +
> +	rpm = dev_get_drvdata(pdev->dev.parent);
> +	if (!rpm) {
> +		dev_err(&pdev->dev, "unable to retrieve handle to rpm\n");
> +		return -ENODEV;
> +	}
> +
> +	match = of_match_device(rpm_of_match, &pdev->dev);
> +	rpm_match = match->data;
> +	of_match = rpm_match->of_match;
> +
> +	ret = of_regulator_match(&pdev->dev, pdev->dev.of_node,
> +				 of_match,
> +				 rpm_match->size);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev,
> +			"Error parsing regulator init data: %d\n", ret);
> +		return ret;
> +	}
> +
> +	for (; of_match < rpm_match->of_match + rpm_match->size; of_match++) {
> +		if (!of_match->of_node)
> +			continue;
> +		ret = rpm_regulator_register(pdev, of_match, rpm);
> +		if (ret) {
> +			dev_err(&pdev->dev, "can't register regulator\n");
> +			return ret;
> +		}
>   	}
>
>   	return 0;
>
