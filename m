From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] of/mips: Cleanup some include directives/files.
Date: Wed, 20 Oct 2010 12:03:32 -0600
Message-ID: <20101020180332.GO7285@angua.secretlab.ca>
References: <1287528631-31797-1-git-send-email-ddaney@caviumnetworks.com>
	<20101020065830.GA12565@linux-mips.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20101020065830.GA12565-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Oct 20, 2010 at 07:58:30AM +0100, Ralf Baechle wrote:
> On Tue, Oct 19, 2010 at 03:50:31PM -0700, David Daney wrote:
> 
> > The __init directives should go on the definitions of things, not the
> > declaration, also __init is meaningless for inline functions, so
> > remove it from prom.h.  This allows us to get rid of a useless
> > #include, but most of the rest of them are useless too, so kill them
> > as well.
> > 
> > If of_i2c.c needs irq definitions, it should include linux/irq.h
> > directly, not assume indirect inclusion via asm/prom.h.
> 
> Grant, I assume you're going to merge this one.
> 
> Acked-by: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>

Yes, I'll pick it up.  I'm compile testing now.

g.

> 
>   Ralf
