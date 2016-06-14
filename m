From: chunfeng yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v3,2/5] dt-bindings: mt8173-mtu3: add devicetree bindings
Date: Tue, 14 Jun 2016 10:19:40 +0800
Message-ID: <1465870780.19154.0.camel@mhfsdcap03>
References: <1465543962-11678-1-git-send-email-chunfeng.yun@mediatek.com>
	 <1465543962-11678-3-git-send-email-chunfeng.yun@mediatek.com>
	 <878tyd761u.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <878tyd761u.fsf@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <felipe.balbi@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Alan Stern <stern@rowland.harvard.edu>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Pawel Moll <pawel.moll@arm.com>, Kumar Gala <galak@codeaurora.org>, Sascha Hauer <s.hauer@pengutronix.de>, Alan Cooper <alcooperx@gmail.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, 2016-06-10 at 12:21 +0300, Felipe Balbi wrote:
> Hi,
> 
> Chunfeng Yun <chunfeng.yun@mediatek.com> writes:
> > + - enable-manual-drd : supports manual dual-role switch via sysfs; only used
> > +	when receptacle is TYPE-A and also wants to support dual-role mode.
> 
> sorry, but this manual-drd can't be accepted. You should rely on a DT
> property for this and you shouldn't expose it to sysfs. Use DebugFS for
> that.
I will make use of debugfs instead
Thanks a lot
> 
> 
