From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v5 4/5] Add fdtget utility to read property values from a
	device tree
Date: Fri, 23 Sep 2011 11:20:07 +1000
Message-ID: <20110923012007.GG12286@yookeroo.fritz.box>
References: <1316711466-14199-1-git-send-email-sjg@chromium.org>
	<1316711466-14199-5-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1316711466-14199-5-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 22, 2011 at 10:11:05AM -0700, Simon Glass wrote:
> This simply utility makes it easy for scripts to read values from the device
> tree. It is written in C and uses the same libfdt as the rest of the dtc
> package.
> 
> What is it for:
> - Reading fdt values from scripts
> - Extracting fdt information within build systems
> - Looking at particular values without having to dump the entire tree
> 
> To use it, specify the fdt binary file on command line followed by a list of
> node, property pairs. The utility then looks up each node, finds the property
> and displays the value.
> 
> Each value is printed on a new line.
> 
> fdtget tries to guess the type of each property based on its contents. This
> is not always reliable, so you can use the -t option to force fdtget to decode
> the value as a string, or byte, etc.
> 
> To read from stdin, use - as the file.
> 
> Usage:
> 	fdtget <options> <dt file> [<node> <property>]...
> Options:
> 	-t <type>	Type of data
> 	-h		Print this help
> 
> <type>	s=string, i=int, u=unsigned, x=hex
> 	Optional modifier prefix:
> 		hh or b=byte, h=2 byte, l=4 byte (default)
> 
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Acked-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
