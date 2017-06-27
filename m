From: Hugues FRUCHET <hugues.fruchet@st.com>
Subject: Re: [PATCH v1 2/6] [media] ov9650: add device tree support
Date: Tue, 27 Jun 2017 10:14:46 +0000
Message-ID: <00c5784a-8e13-be01-5c9e-4747aaa14ae5@st.com>
References: <1498143942-12682-1-git-send-email-hugues.fruchet@st.com>
 <1498143942-12682-3-git-send-email-hugues.fruchet@st.com>
 <20170626163102.GQ12407@valkosipuli.retiisi.org.uk>
 <D780984B-70A1-4E9C-A887-DD2CBAAC7CCA@goldelico.com>
 <20170627053642.GW12407@valkosipuli.retiisi.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170627053642.GW12407@valkosipuli.retiisi.org.uk>
Content-Language: en-US
Content-ID: <2B917BC86A1C8248B4FEBDFE843330DF@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sakari Ailus <sakari.ailus@iki.fi>, "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Alexandre TORGUE <alexandre.torgue@st.com>, LKML <linux-kernel@vger.kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Yannick FERTRE <yannick.fertre@st.com>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
List-Id: devicetree@vger.kernel.org



On 06/27/2017 07:36 AM, Sakari Ailus wrote:
> On Mon, Jun 26, 2017 at 07:46:34PM +0200, H. Nikolaus Schaller wrote:
>> Hi,
>>
>>> Am 26.06.2017 um 18:31 schrieb Sakari Ailus <sakari.ailus@iki.fi>:
>>>
>>> Hi Hugues,
>>>
>>> On Thu, Jun 22, 2017 at 05:05:38PM +0200, Hugues Fruchet wrote:
>>>> @@ -1545,15 +1577,22 @@ static int ov965x_remove(struct i2c_client *client)
>>>> }
>>>>
>>>> static const struct i2c_device_id ov965x_id[] = {
>>>> -	{ "OV9650", 0 },
>>>> -	{ "OV9652", 0 },
>>>> +	{ "OV9650", 0x9650 },
>>>> +	{ "OV9652", 0x9652 },
>>>
>>> This change does not appear to match with the patch description nor it the
>>> information is used. How about not changing it, unless there's a reason to?
>>> The same for the data field of the of_device_id array below.
>>
>> I think it could/should be used to check if the camera chip that is found
>> by reading the product-id and version registers does match what the device
>> tree expects and abort probing on a mismatch.
> 
> Makes sense. But it should be a separate patch, shouldn't it?
> 
> You could also put the id to the ops struct, and choose the ops struct that
> way. Entirely up to you.
> 

I'll suggest to skip the id check between DT compatible string and real 
device id read from sensor, this is not something I see in other drivers 
currently.
But I would suggest to keep in a separate patch the switch of device id 
names to lower case in order to align with other omnivision cameras and 
not introduce upper/lower case potential bugs in DT later on (as the one 
encountered by Nikolaus):

  [media] ov9650: switch i2c device id to lower case

  static const struct i2c_device_id ov965x_id[] = {
-	{ "OV9650", 0 },
-	{ "OV9652", 0 },
+	{ "ov9650", 0 },
+	{ "ov9652", 0 },


  [media] ov9650: add device tree support

+static const struct of_device_id ov965x_of_match[] = {
+	{ .compatible = "ovti,ov9650", },
+	{ .compatible = "ovti,ov9652", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, ov965x_of_match);
+
  static struct i2c_driver ov965x_i2c_driver = {
  	.driver = {
  		.name	= DRIVER_NAME,
+		.of_match_table = of_match_ptr(ov965x_of_match),
