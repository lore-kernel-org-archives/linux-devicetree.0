From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: Re: Disallow re-use of the same label within a dts file
Date: Tue, 23 Feb 2010 09:06:23 -0600
Message-ID: <E1NjwL9-0001iz-5s@jdl.com>
References: <20100223085641.GG12285@yookeroo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <20100223085641.GG12285@yookeroo> 
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

> Currently, nothing will stop you from re-using the same label string
> multiple times in a dts, e.g.:
> 	/ {
> 		samelabel: prop1 = "foo";
> 		samelabel: prop2 = "bar";
> 	};
> 
> or
> 	/ {
> 		samelabel: prop1 = "foo";
> 		samelabel: subnode {
> 		};
> 	};
> 
> When using node references by label, this could lead to confusing
> results (with no warning), and in -Oasm mode will result in output
> which the assembler will complain about (since it too will have
> duplicate labels).
> 
> This patch, therefore, adds code to checks.c to give errors if you
> attempt to re-use the same label.  It treats all labels (node,
> property, and value) as residing in the same namespace, since the
> assembler will treat them so for -Oasm mode.
> 
> Testcases for the new code are also added.
> 
> Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

Applied.
