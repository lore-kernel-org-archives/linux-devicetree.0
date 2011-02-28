From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC PATCH] ipmi: convert OF driver to platform driver
Date: Mon, 28 Feb 2011 01:04:14 -0700
Message-ID: <20110228080414.GB13690@angua.secretlab.ca>
References: <1298497079-20546-1-git-send-email-robherring2@gmail.com>
	<20110224031528.GB12139@angua.secretlab.ca>
	<201102241534.50886.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201102241534.50886.arnd-r2nGTMty4D4@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Christian Krafft <parabelboi-KeEWkn+XTfLB6mOc/IgfSw@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Feb 24, 2011 at 03:34:50PM +0100, Arnd Bergmann wrote:
> On Thursday 24 February 2011, Grant Likely wrote:
> > On Wed, Feb 23, 2011 at 03:37:59PM -0600, Rob Herring wrote:
> > > From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> > > 
> > > of_bus is deprecated in favor of the plain platform bus. This patch
> > > merges the ipmi OF driver with the existing platform driver.
> > > 
> > > CONFIG_PPC_OF occurrances are removed or replaced with CONFIG_OF.
> > > 
> > > Compile tested with and without CONFIG_OF. Tested OF probe and
> > > default probe cases.
> > > 
> > > Signed-off-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> > 
> > Wow.  That driver does some weird things with the driver model that
> > really should be cleaned up.  That said, this change looks correct.
> > I'll add it to my tree and see how it goes.
> 
> Please keep me in the look when you want to do further into cleaning
> this up. The OF code was initially done for the QS21 running SLOF, and
> predates the flattened device tree specs.

Will do.  I've got no plans to fiddle with this code beyond getting
rid of the of_platform_driver abstractions, but I'll keep my eye out
for changes that you should be cc'd on.

g.
