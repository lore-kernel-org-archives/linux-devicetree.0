From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: Writing Device Tree Source (DTS)
Date: Mon, 30 Nov 2009 14:57:54 -0600
Message-ID: <20091130205754.GA11487@loki.buserror.net>
References: <200911230858.nAN8vsWf006884@arlmailha04.patni.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <200911230858.nAN8vsWf006884-QAxaCDP67tRcIBjhHP3Ktq0bRtRcJeJQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Kumar Amarjit <amarjit.kumar-7K+nh26gSkEAvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, amarjit.kumar.mtech-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 23, 2009 at 02:27:44PM +0530, Kumar Amarjit wrote:
> Hi All,
> We are using PowerPc440 core on our Soc that consists of PCIe core, SAS core
> and many other things.
> We are writing DTS for our board to be used during booting, we have gone
> through various dts files available inside the Linux Kernel 2.6.31.
> Our board is closets match with Taishan board.
> While referring the Taishan.dts, we are unable to get the information
> regarding Interrupt-map and interrupt-map-mask property.
> Please refer to the snippet.......
> It would be great if anybody help me to understand the way they are writing
> these properties?
> I also gone through the DTS document booting-without-of but that does not
> help us, so anybody having any documents on How To Write DTS can help me
> out.

These properties are documented in ePAPR -- or you can look at the original
Open Firmware interrupt mapping recommended practice document plus the PCI
binding.

-Scott
