From: Jean-Jacques Hiblot <jjhiblot@traphandler.com>
Subject: Re: [PATCH v2] dt: platform driver: Fill the resources before probe
 and defer if needed
Date: Mon, 17 Mar 2014 12:07:37 +0100
Message-ID: <CACh+v5P=tcc-h_9r7Btwyu+jWjwH2ocmW4VCgDYqY7VMWsHuOA@mail.gmail.com>
References: <20140220153042.DF053C4050F@trevor.secretlab.ca>
 <1392988720-20976-1-git-send-email-jjhiblot@traphandler.com>
 <20140308073758.DA63FC408EC@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20140308073758.DA63FC408EC@trevor.secretlab.ca>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
Cc: devicetree <devicetree@vger.kernel.org>, Jean-Jacques Hiblot <jjhiblot@traphandler.com>, gregkh <gregkh@linuxfoundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, robh+dt <robh+dt@kernel.org>, Gregory CLEMENT <gregory.clement@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Grant,

Sorry for the delay, I was having nice vacations.

2014-03-08 8:37 GMT+01:00 Grant Likely <grant.likely@linaro.org>:
> On Fri, 21 Feb 2014 14:18:40 +0100, Jean-Jacques Hiblot <jjhiblot@traphandler.com> wrote:
>> The goal of this patch is to allow drivers to be probed even if at the time of
>> the DT parsing some of their ressources are not available yet.
>
> Hi Jean-Jacques
>
> [...]
>> +int of_platform_device_prepare(struct platform_device *dev)
>> +{
>> +     struct device_node *np;
>> +     int i, irq_index;
>> +     struct resource *res;
>> +
>> +     /*
>> +      * This function applies only devices described in the DT.
>> +      * Other platform devices have their ressources already populated.
>> +      */
>> +     np = dev->dev.of_node;
>> +     if (!np)
>> +             return 0;
>
> I believe we already talked about the above test. This function must
> only process devices created by of_platform_populate(). Merely checking
> the of_node pointer is not a sufficient test because there are other
> paths in the kernel for creating platform_devices that might get a node
> pointer attached to it.
Yes we talked about this, but only to move it into of_platform_device_prepare().
Is there an existing way to know for sure that the device has been
created by of_platform_populate() ? I could not find one.

Jean-Jacques
>
> g.
>
