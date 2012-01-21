From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: Re: [PATCH v6 1/2] Add fdtget utility to read property values from a
 device tree
Date: Sat, 21 Jan 2012 15:26:30 -0600
Message-ID: <E1RoiSE-0002C5-Tf@jdl.com>
References: <1327169688-7569-2-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <1327169688-7569-2-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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

Applied.

jdl
