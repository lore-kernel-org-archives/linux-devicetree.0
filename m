From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 0/3] arm64: dts: r8a7796: add usb host device nodes
Date: Thu, 17 Aug 2017 10:20:28 +0200
Message-ID: <20170817082028.GA27693@verge.net.au>
References: <1501763324-26028-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20170804105919.GA9178@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170804105919.GA9178@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Aug 04, 2017 at 12:59:19PM +0200, Simon Horman wrote:
> On Thu, Aug 03, 2017 at 09:28:41PM +0900, Yoshihiro Shimoda wrote:
> > This patch is based on the renesas.git / renesas-devel-20170731v2-v4.13-rc3 tag.
> > 
> > For usb2.0 host, we need the following patch:
> >  https://patchwork.kernel.org/patch/9864583/
> > 
> > For usb3.0 host, we need the following patch:
> >  https://patchwork.kernel.org/patch/9864579/
> 
> Thanks, I am marking this series as deferred pending acceptance of the
> above patches. Please repost this series or otherwise ping me once the
> dependencies are in place.

It looks like Geert has accepted the patches above,
accordingly I have applied this series.
