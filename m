From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 5/5] arm64: dts: marvell: add XOR node for Armada
 3700 SoC
Date: Tue, 26 Apr 2016 09:28:11 +0200
Message-ID: <20160426092811.62d092bf@free-electrons.com>
References: <1460652818-14647-1-git-send-email-gregory.clement@free-electrons.com>
	<1460652818-14647-6-git-send-email-gregory.clement@free-electrons.com>
	<20160426033536.GD2274@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160426033536.GD2274@localhost>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Romain Perier <romain.perier-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Omri Itach <omrii-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Marcin Wojtas <mw-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Vinod,

On Tue, 26 Apr 2016 09:05:36 +0530, Vinod Koul wrote:
> On Thu, Apr 14, 2016 at 06:53:38PM +0200, Gregory CLEMENT wrote:
> > From: Marcin Wojtas <mw-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>
> > 
> > Armada 3700 SoC comprise one dual-channel XOR engine and this
> > patch adds its according representation.
> 
> This need an ACK from ARM folks..

Well, this patch has the SoB from Gregory Clement, who is one of the
maintainers of the ARM Marvell Armada platforms. And he should be the
one taking this patch in his tree (especially since a lot of others
Armada 3700 DT changes are going to be made).

So I guess that the intent is that you take patches 1 to 4, and patch 5
will be taken by Gregory.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
