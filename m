From: David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
Subject: Re: [RFC PATCH 00/12] Merge common OpenFirmware device tree code
Date: Wed, 07 Oct 2009 21:39:15 -0700 (PDT)
Message-ID: <20091007.213915.37481688.davem@davemloft.net>
References: <Pine.LNX.4.60.0910072148040.11795@mailgate.netunix.com>
	<20091007.140938.255120957.davem@davemloft.net>
	<Pine.LNX.4.60.0910080155210.12519@mailgate.netunix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <Pine.LNX.4.60.0910080155210.12519-pb599fR3TxWvwYtD5Hs6llaTQe2KTcn/@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: crn-Tjka5CH3XzFBDgjK7y7TUQ@public.gmane.org
Cc: sammy-4OGMY2YDKIVeoWH0uzbU5w@public.gmane.org, sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org, microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, sparclinux-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Chris Newport <crn-Tjka5CH3XzFBDgjK7y7TUQ@public.gmane.org>
Date: Thu, 8 Oct 2009 02:29:25 +0100 (BST)

> Sun4d has never had SMP support and

Wrong.

> this is apparantly problematic due to Cray interlectual property
>  causing a lack of bus documentation.

XBUS documentation is not available, but we fully know how to
program the SBUS interrupt controller and whatnot.  It's all
there in the sun4d interrupt and SMP support and it did work
just fine at one point.

Amusingly the SBUS interrupt stuff on sun4d is a very close
sibling to the IMAP/ICLR scheme used on sun4u.
