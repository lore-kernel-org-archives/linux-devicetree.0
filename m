From: Min Guo <min.guo@mediatek.com>
Subject: Re: [PATCH v4 1/6] dt-bindings: usb: musb: Add support for MediaTek
 musb controller
Date: Fri, 25 Jan 2019 10:07:26 +0800
Message-ID: <1548382046.4433.304.camel@mhfsdcap03>
References: <1548073351-13739-1-git-send-email-min.guo@mediatek.com>
         <1548073351-13739-2-git-send-email-min.guo@mediatek.com>
         <20190121151417.GA19238@bogus> <1548149773.4433.284.camel@mhfsdcap03>
         <20190122143348.GF30080@uda0271908>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190122143348.GF30080@uda0271908>
Sender: linux-kernel-owner@vger.kernel.org
To: Bin Liu <b-liu@ti.com>, Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, hdegoede@redhat.com, tony@atomide.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, Alan Stern <stern@rowland.harvard.edu>, chunfeng.yun@mediatek.com, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Bin,

Thanks for your help.

Hi Rob,

I find that Samsung describes the usb-connector attribute in DTS, and
uses a private driver.
And try to write DTS as following:

usb-connector node:
musb_con: musb_connector{
    compatible = "linux,extcon-usb-gpio","usb-b-connector";
    lable = "micro-USB";
    type = "micro";
    id-gpio = <&pio 44 GPIO_ACTIVE_HIGH>
    vbus-supply = <&usb_vbus>;
    port {
        usb_to_connector: endpoint {
            remote-endpoint = <&connector_to_usb>;
        };
    };
};

usb node:
&usb2{
    status = "okay";
    port {
        connector_to_usb: endpoint {
            remote-endpoint = <&usb_to_connector>;
        };
    };
}

Can I describe usb-connector like this? Or can you give me some advices?

Regards,
Min.

On Tue, 2019-01-22 at 08:33 -0600, Bin Liu wrote:
> Hi Min,
> 
> On Tue, Jan 22, 2019 at 05:36:13PM +0800, Min Guo wrote:
> > Hi Bin,
> > 
> > Sorry to bother you again, I encounter a problem about the extcon
> > property.
> > 
> > I don't find a common driver describing the usb-connector. Is
> > there any driver that I can refer to, specially the way to switch MUSB
> > controller between host and device mode? 
> > If it needs to implement by myself, is it possible to emulate an
> > usb-connector driver by extcon-usb-gpio, and also use the notifier
> > mechanism or can you give me some advices?
> 
> I am afraid I am unable to help you on this. I wasn't really pay
> attention when usb-connector was introduced and not sure how it can
> replace extcon. Now after read usb-connector.txt, it seems the binding
> only defines a/b/c-connector, but not ab-connector, and there is no
> enough information (at least for me) explaining how VBUS and ID fix into
> this usb-connector binding.
> 
> Maybe Rob can provide some hint.
> 
> Regards,
> -Bin.
