From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v5 5/5] Add fdtput utility to write property values to a
	device tree
Date: Fri, 23 Sep 2011 11:20:28 +1000
Message-ID: <20110923012028.GH12286@yookeroo.fritz.box>
References: <1316711466-14199-1-git-send-email-sjg@chromium.org>
	<1316711466-14199-6-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1316711466-14199-6-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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

On Thu, Sep 22, 2011 at 10:11:06AM -0700, Simon Glass wrote:
> This simple utility allows writing of values into a device tree from the
> command line. It aimes to be the opposite of fdtget.
> 
> What is it for:
> - Updating fdt values when a binary blob already exists
>    (even though source may be available it might be easier to use this
> utility rather than sed, etc.)
> - Writing machine-specific fdt values within a build system
> 
> To use it, specify the fdt binary file on command line followed by the node
> and property to set. Then, provide a list of values to put into that
> property. Often there will be just one, but fdtput also supports arrays and
> string lists.
> 
> fdtput does not try to guess the type of the property based on looking at
> the arguments. Instead it always assumes that an integer is provided. To
> indicate that you want to write a string, use -ts. You can also provide
> hex values with -tx.
> 
> The command line arguments are joined together into a single value. For
> strings, a nul terminator is placed between each string when it is packed
> into the property. To avoid this, pass the string as a single argument.
> 
> Usage:
> 	fdtput <options> <dt file> <<node> <property> [<value>...]
> Options:
> 	-t <type>	Type of data
> 	-v		Verbose: display each value decoded from command line
> 	-h		Print this help
> 
> <type>	s=string, i=int, u=unsigned, x=hex
> 	Optional modifier prefix:
> 		hh or b=byte, h=2 byte, l=4 byte (default)
> 
> To read from stdin and write to stdout, use - as the file. So you can do:
> 
> cat somefile.dtb | fdtput -ts - /node prop "My string value" > newfile.dtb
> 
> This commit also adds basic tests to verify the major features.
> 
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Acked-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
