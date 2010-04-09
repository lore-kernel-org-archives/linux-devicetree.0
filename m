From: Paul Brook <paul-qD8j1LwMmJjtCj0u4l0SBw@public.gmane.org>
Subject: Re: [Qemu-devel] [RFC PATCH 1/7] devicetree: Add 8k instead of double
	dtb size when reserving extra memory
Date: Fri, 9 Apr 2010 13:00:57 +0100
Message-ID: <201004091300.57740.paul@codesourcery.com>
References: <20100407040129.20274.44284.stgit@angua>
	<20100407041002.20274.51604.stgit@angua>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20100407041002.20274.51604.stgit@angua>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org
List-Id: devicetree@vger.kernel.org

> If a small 'seed' dtb file is loaded into qemu and then heavily modified
> (say for runtime population of all the device nodes), then 2x the dtb
> size turns out not to be very much.
> 
> This patch changes the device tree loading code to add a fixed 8k of
> additional space to the dtb buffer.

In that case you almost certainly want double+8k. Or have the calleee tell you 
how much they're expecting to grow the tree.

Paul
