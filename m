From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: Re: [RFC 4/7] soc: qcom: Add Shared Memory Manager driver
Date: Tue, 30 Sep 2014 07:15:06 -0700
Message-ID: <20140930141505.GJ28481@sonymobile.com>
References: <1412037291-16880-1-git-send-email-bjorn.andersson@sonymobile.com>
 <1412037291-16880-5-git-send-email-bjorn.andersson@sonymobile.com>
 <542A4AEF.2030402@smartplayin.com>
 <542A4D80.60101@smartplayin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <542A4D80.60101@smartplayin.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Kiran Padwal <kiran.padwal@smartplayin.com>
Cc: Kumar Gala <galak@codeaurora.org>, Andy Gross <agross@codeaurora.org>, Arnd Bergmann <arnd@arndb.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, Suman Anna <s-anna@ti.com>
List-Id: devicetree@vger.kernel.org

On Mon 29 Sep 23:28 PDT 2014, Kiran Padwal wrote:

>=20
> Hi,
>=20
> On Tuesday 30 September 2014 11:47 AM, Kiran Padwal wrote:
> > Hi Bjorn,
> >=20
> > On Tuesday 30 September 2014 06:04 AM, Bjorn Andersson wrote:
[..]
> >> +	smem->hwlock =3D of_hwspin_lock_request(pdev->dev.of_node, NULL)=
;
> >=20
> > Compilation breaks while I try to compile with this patch.
> > Do I missing anything? Below is the error I am getting,
> >=20
> > drivers/soc/qcom/qcom_smem.c: In function =91qcom_smem_probe=92:
> > drivers/soc/qcom/qcom_smem.c:274:2: error: implicit declaration of =
function =91of_hwspin_lock_request=92 [-Werror=3Dimplicit-function-decl=
aration]
> >   smem->hwlock =3D of_hwspin_lock_request(pdev->dev.of_node, NULL)
>=20
> I am sorry I missed the note in commit message of this patch. I did l=
ook for any such note in cover letter=20
> and also googled around for any change to find this function.
> Could not find and hence posted comment. Please ignore.
>=20

I respun this ontop of Suman Anna's latest hwspinlock patches [1] and [=
2].

The above code should now be:

        hwlock_id =3D of_hwspin_lock_get_id(pdev->dev.of_node, 0);
	smem->hwlock =3D hwspin_lock_request_specific(hwlock_id);

Will include this in the next spin.

[1] https://patchwork.kernel.org/patch/4898051/
[2] https://patchwork.kernel.org/patch/4898071/

Regards,
Bjorn
