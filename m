From: David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
Subject: Re: [PATCH v3] of: Create asm-generic/of.h and provide default
	of_node_to_nid()
Date: Mon, 26 Jul 2010 18:38:08 -0700 (PDT)
Message-ID: <20100726.183808.15223674.davem@davemloft.net>
References: <AANLkTikcV3jJUm_My-oK-drudSDz3M2iH1cWhxdt+W1s@mail.gmail.com>
	<20100726.154854.35052662.davem@davemloft.net>
	<AANLkTikpON7WUkTLrnW4y2kghM=H8cLCAFst08S3cL_Z@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <AANLkTikpON7WUkTLrnW4y2kghM=H8cLCAFst08S3cL_Z-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
Cc: sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org, microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, sparclinux-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Date: Mon, 26 Jul 2010 16:51:01 -0600

> Indeed.  I looked at it briefly, but it wasn't immediately clear what
> the impact would be to switch powerpc over to -1, and it looked to me
> like sparc depends on -1 to signify no node association.

Kernel wide, NUMA interfaces tend to take "-1" to mean "any node."

I had looked over the powerpc cases, and besides 1 or 2 strange
locations the powerpc call sites were ready to handle -1.
