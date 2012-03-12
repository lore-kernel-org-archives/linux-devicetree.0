From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] dtc: Add -i option to support search paths
Date: Tue, 13 Mar 2012 10:53:32 +1100
Message-ID: <20120312235332.GD24916@truffala.fritz.box>
References: <1331082612-10612-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1331082612-10612-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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

On Tue, Mar 06, 2012 at 05:10:12PM -0800, Simon Glass wrote:
> It is often inconvenient to place device tree files in the same directory
> as their includes, or to specify the full path to include files.
> 
> An example of this is in U-Boot where we have a .dtsi file for each SOC
> type, and this is included by the board .dts file. We need to either use
> a mechanism like:
> 
> /include/ ARCH_CPU_DTS
> 
> with sed or cpp to perform the replacement with the correct path, or
> we must specify the full path in the file:
> 
> /include/ "../../arch/arm/dts/tegra20.dtsi"
> 
> The first option is not desirable since it requires anyone compiling the
> file to first pre-process it. The second is not desirable since it
> introduces a path which is project-specific into a file which is supposed
> to be a hardware description. For example Linux and U-Boot are unlikely to
> put these include files in the same place.
> 
> It is much more convenient to specify the search patch on the command line
> as is done with C pre-processors, for example.
> 
> Introduce a -i option to add to the list of search paths used to find
> source and include files.
> 
> We cannot use -I as it is already in use. Other suggestions welcome.

Looks pretty nice.  Include paths is a feature we've been kind of
wanting for a bit, and this implementation looks reasonable. Obviously
the fact that it's -i not -I like gcc isn't great, but as you say -I
is already used, and I can't see a better option.

The only potential problem I can see is that it uses the same search
path for /include/ and /incbin/.  I'm not sure if that's what we want
or not.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
