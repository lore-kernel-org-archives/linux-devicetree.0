From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: Re: [PATCH v6 2/2] Add fdtput utility to write property values to a
 device tree
Date: Sat, 21 Jan 2012 15:28:08 -0600
Message-ID: <E1RoiTo-0002DJ-58@jdl.com>
References: <1327169688-7569-2-git-send-email-sjg@chromium.org>
 <1327169688-7569-3-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <1327169688-7569-3-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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

> This simple utility allows writing of values into a device tree from the
> command line. It aimes to be the opposite of fdtget.
> 
> What is it for:
> - Updating fdt values when a binary blob already exists
>    (even though source may be available it might be easier to use this
>     utility rather than sed, etc.)
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

Applied.

Also, "make check" didn't know to build fdtput nor fdtget.  So I added
a new ${TEST_BIN} in the top level Makefile to track which executables
are tested.

Thanks,
jdl
