From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: Re: Assorted cleanups and extensions for ftdump
Date: Tue, 17 Nov 2009 08:10:28 -0600
Message-ID: <E1NAOlI-00019b-1s@jdl.com>
References: <20091117060053.GC2576@yookeroo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <20091117060053.GC2576@yookeroo> 
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

> This patch makes a number of minor changes to the ftdump debugging
> tool.
> 
>  * There was an endian bug in one place, which this fixes.
> 
>  * We now use const qualifiers in a number of places where we can
> 
>  * ftdump can now be instructed to read from stdin by giving "-" as
>    the filename.
> 
>  * The buffer into which the blob is read is increased from 16k to
>    64k, and is now dynamically allocated.
> 
>  * ftdump now emits source in dts-v1 format
> 
> Since ftdump is little used these days, these fixes are arguably of
> little use.  On the other hand, I already did the work of making the
> changes some time back, so I guess we might as well fold these small
> fixes and improvements in.
> 
> Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

Applied.

jdl
