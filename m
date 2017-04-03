From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] Input: silead - list all supported compatible strings in
 binding document
Date: Mon, 3 Apr 2017 11:59:24 -0700
Message-ID: <20170403185924.GG34530@dtor-ws>
References: <20170329182531.17349-1-javier@osg.samsung.com>
 <20170403152543.im7tbkhfc3lj7lyt@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-input-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170403152543.im7tbkhfc3lj7lyt@rob-hp-laptop>
Sender: linux-input-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Robert Dolca <robert.dolca@intel.com>, Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 03, 2017 at 10:25:43AM -0500, Rob Herring wrote:
> On Wed, Mar 29, 2017 at 02:25:31PM -0400, Javier Martinez Canillas wrote:
> > The driver contains compatible strings for different models, but the DT
> > binding doc only lists one of them. Add the remaining to the document.
> > 
> > Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> > ---
> > 
> >  .../devicetree/bindings/input/touchscreen/silead_gsl1680.txt       | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> "dt-bindings: input: ..." is preferred for the subject, but no need to 
> respin just for that.
> 
> Acked-by: Rob Herring <robh@kernel.org> 

Applied, thank you.

-- 
Dmitry
