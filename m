From: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Subject: Re: Re: [PATCH v4 3/3] ARM: sun7i/sun6i: irqchip:
 Update the documentation
Date: Mon, 3 Mar 2014 14:37:30 +0100
Message-ID: <CAOQ7t2Z6UuKNfUDUYC1oaZAHKQ-3Sjffe-M2h1GACsERbV9_jg@mail.gmail.com>
References: <1393529662-8663-1-git-send-email-carlo@caione.org>
	<1393529662-8663-4-git-send-email-carlo@caione.org>
	<20140303110240.GW607@lukather>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBDWJTUUC5UCBBKML2KMAKGQENAAJ6AY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20140303110240.GW607@lukather>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Mar 3, 2014 at 12:02 PM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> Hi,
>
> On Thu, Feb 27, 2014 at 08:34:22PM +0100, Carlo Caione wrote:
>> Added documentation for NMI irqchip.
>>
>> Signed-off-by: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
>> ---
>>  .../allwinner,sun67i-sc-nmi.txt                    | 27 ++++++++++++++++++++++
>>  1 file changed, 27 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/allwinner,sun67i-sc-nmi.txt
>>
>> diff --git a/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun67i-sc-nmi.txt b/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun67i-sc-nmi.txt
>> new file mode 100644
>> index 0000000..ac31487
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun67i-sc-nmi.txt
>> @@ -0,0 +1,27 @@
>> +Allwinner Sunxi NMI Controller
>> +==============================
>> +
>> +Required properties:
>> +
>> +- compatible : should be "allwinner,sun7i-a20-sc-nmi" or
>> +  "allwinner,sun6i-a31-sc-nmi"
>> +- reg : Specifies base physical address and size of the registers.
>> +- interrupt-controller : Identifies the node as an interrupt controller
>> +- #interrupt-cells : Specifies the number of cells needed to encode an
>> +  interrupt source. The value shall be 2. The first cell is the IRQ number, the
>> +  second cell the trigger type.
>
> What values correspond to what trigger type? What are the accepted values?
>
>> +- interrupt-parent: Specifies the parent interrupt controller.
>> +- interrupts: Specifies the list of interrupt lines which are handled by
>> +  the interrupt controller in the parent controller's notation. This value
>> +  shall be the NMI.
>
> Hmmm, there's only one interrupt, not a list of them.

Fix for both in v5.

Thank you,

-- 
Carlo Caione
