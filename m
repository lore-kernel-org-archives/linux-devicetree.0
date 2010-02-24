From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: Re: dtc: Allow multiple labels on nodes and properties (v2)
Date: Wed, 24 Feb 2010 08:57:05 -0600
Message-ID: <E1NkIfh-0005pc-R0@jdl.com>
References: <20100224010312.GF7187@yookeroo> <20100224072217.GJ7187@yookeroo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <20100224072217.GJ7187@yookeroo> 
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

> Oops, don't apply that one, it has an uninitialized variable bug.
> Here's a fixed version.
> 
> dtc: Allow multiple labels on nodes and properties
> 
> At present, both the grammar and our internal data structures mean
> that there can be only one label on a node or property.  This is a
> fairly arbitrary constraint, given that any number of value labels can
> appear at the same point, and that in C you can have any number of
> labels on the same statement.
> 
> This is pretty much a non-issue now, but it may become important with
> some of the extensions that Grant and I have in mind.  It's not that
> hard to change, so this patch does so, allowing an arbitrary number of
> labels on any given node or property.  As usual a testcase is added
> too.
> 
> Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
> 
> Index: dtc/tests/multilabel.dts
> ===================================================================
> --- /dev/null	1970-01-01 00:00:00.000000000 +0000
> +++ dtc/tests/multilabel.dts	2010-02-24 17:57:12.736958851 +1100
> @@ -0,0 +1,38 @@


So, I applied this.  But I had to make an extra amend step to
fix three things after applying it:

    - Remove the meta-comment, (placed after triple dash line)
    - Remove the extraneous "(v2)", (placed in Subject brackets)
    - Remove the duplicate Subject: line, (not repeated in body)

If instead the patch were formatted thusly, it would all just work:

    To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
    cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
    Subject: [PATCH v2] dtc: Allow multiple labels on nodes and properties

    At present, both the grammar and our internal data structures mean
    that there can be only one label on a node or property.  This is a
    fairly arbitrary constraint, given that any number of value labels can
    appear at the same point, and that in C you can have any number of
    labels on the same statement.
    
    This is pretty much a non-issue now, but it may become important with
    some of the extensions that Grant and I have in mind.  It's not that
    hard to change, so this patch does so, allowing an arbitrary number of
    labels on any given node or property.  As usual a testcase is added
    too.
    
    Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

    ---

    Oops, don't apply that one, it has an uninitialized variable bug.
    Here's a fixed version.
   
    Index: dtc/tests/multilabel.dts
    ===================================================================
    --- /dev/null	1970-01-01 00:00:00.000000000 +0000
    +++ dtc/tests/multilabel.dts	2010-02-24 17:57:12.736958851 +1100
    @@ -0,0 +1,38 @@

Thanks,
jdl
