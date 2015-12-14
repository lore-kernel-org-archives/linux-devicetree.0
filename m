From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 2/2] mfd: arizona: Update binding docs for selecting
 mono/stereo outputs
Date: Mon, 14 Dec 2015 09:13:53 +0000
Message-ID: <20151214091353.GR6058@localhost.localdomain>
References: <1449829703-600-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1449829703-600-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <20151211173353.GA7664@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20151211173353.GA7664@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: lee.jones@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

On Fri, Dec 11, 2015 at 11:33:53AM -0600, Rob Herring wrote:
> On Fri, Dec 11, 2015 at 10:28:23AM +0000, Charles Keepax wrote:
> > Update the device tree binding documentation to include the wlf,out-mono
> > property that is used to specify whether each output is a mono or stereo
> > output.
> 
> You just added this binding and updating it already? While we may like 
> kernel changes incremental, we don't like bindings evolving any more 
> than necessary.

The binding has been around for ages I have been working through
updating it to actually include more of the functionality of the
driver. The last set of changes where some initial work on the
jack detection, this is a fairly self contained update that
doesn't really relate to the jack detection.

Its a fairly complex part so there is going to be quite a lot to
the binding. I have basically been upstreaming them as much as
possible in groups of similar functionality, as I have time to
work on them.  I could try save the changes up out of tree and
collect together into much larger chains, if you felt strongly
about it? But I am not really clear that helps much. As I have to
hang on to much more out of tree code, people using the part have
to wait longer to have access to useful bindings in mainline and
it makes the CC lists much longer so everyone needs to look at
more email than they need to.

>  
> > Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> > ---
> >  Documentation/devicetree/bindings/mfd/arizona.txt | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/mfd/arizona.txt b/Documentation/devicetree/bindings/mfd/arizona.txt
> > index 2b6ccdb..489dd07 100644
> > --- a/Documentation/devicetree/bindings/mfd/arizona.txt
> > +++ b/Documentation/devicetree/bindings/mfd/arizona.txt
> > @@ -65,6 +65,10 @@ Optional properties:
> >      that have not been specified are set to 0 by default. Entries are:
> >      <IN1, IN2, IN3, IN4> (wm5102, wm5110, wm8280, wm8997)
> >      <IN1A, IN2A, IN1B, IN2B> (wm8998, wm1814)
> > +  - wlf,out-mono : A boolean indicating whether each output is mono or stereo.
> > +    A non-zero value indicates a mono output. If present, the number of values
> > +    should be less than or equal to the number of outputs, if less values are
> > +    supplied the additional outputs will be treated as stereo.
> 
> How do you know which outputs are which with a variable number? 

Position in the array (ie. first entry is the first output, and
so on). I will respin to update the comment to make this more
clear.

Thanks,
Charles
