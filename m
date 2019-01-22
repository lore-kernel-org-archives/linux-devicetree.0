From: Bin Liu <b-liu@ti.com>
Subject: Re: [PATCH v4 1/6] dt-bindings: usb: musb: Add support for MediaTek
 musb controller
Date: Tue, 22 Jan 2019 08:33:48 -0600
Message-ID: <20190122143348.GF30080@uda0271908>
References: <1548073351-13739-1-git-send-email-min.guo@mediatek.com>
 <1548073351-13739-2-git-send-email-min.guo@mediatek.com>
 <20190121151417.GA19238@bogus>
 <1548149773.4433.284.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1548149773.4433.284.camel@mhfsdcap03>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Min Guo <min.guo@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, tony@atomide.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, hdegoede@redhat.com, chunfeng.yun@mediatek.com, Alan Stern <stern@rowland.harvard.edu>, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Min,

On Tue, Jan 22, 2019 at 05:36:13PM +0800, Min Guo wrote:
> Hi Bin,
> 
> Sorry to bother you again, I encounter a problem about the extcon
> property.
> 
> I don't find a common driver describing the usb-connector. Is
> there any driver that I can refer to, specially the way to switch MUSB
> controller between host and device mode? 
> If it needs to implement by myself, is it possible to emulate an
> usb-connector driver by extcon-usb-gpio, and also use the notifier
> mechanism or can you give me some advices?

I am afraid I am unable to help you on this. I wasn't really pay
attention when usb-connector was introduced and not sure how it can
replace extcon. Now after read usb-connector.txt, it seems the binding
only defines a/b/c-connector, but not ab-connector, and there is no
enough information (at least for me) explaining how VBUS and ID fix into
this usb-connector binding.

Maybe Rob can provide some hint.

Regards,
-Bin.
