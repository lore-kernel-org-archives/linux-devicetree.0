From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCHv3 1/3] gpio: add a driver for the Synopsys DesignWare APB
 GPIO block
Date: Wed, 4 Jan 2012 11:21:33 -0700
Message-ID: <20120104182133.GS15503@ponder.secretlab.ca>
References: <1325508798-25439-1-git-send-email-jamie@jamieiles.com>
 <1325508798-25439-2-git-send-email-jamie@jamieiles.com>
 <20120102132500.GB18443@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120102132500.GB18443-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 02, 2012 at 01:25:00PM +0000, Mark Brown wrote:
> On Mon, Jan 02, 2012 at 12:53:16PM +0000, Jamie Iles wrote:
> > The Synopsys DesignWare block is used in some ARM devices (picoxcell)
> > and can be configured to provide multiple banks of GPIO pins.
> > 
> > v3:	- depend on rather than select IRQ_DOMAIN
> > 	- split IRQ support into a separate patch
> > v2:	- use Rob Herring's irqdomain in generic irq chip patches
> > 	- use reg property to indicate bank index
> > 	- support irqs on both edges based on LinusW's u300 driver
> 
> Put stuff like this after the ---, it shouldn't end up in git history.

I disagree.  Keeping the revision history in the git commit is
actually quite useful when trying to figure out which version of a
patch actually got applied.  I'm asking patch authors to keep it above
the ---

g.
