From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH] of: Add a reg-names property to name reg entries
Date: Tue, 25 Oct 2011 06:49:27 +0200
Message-ID: <20111025044927.GA798@ponder.secretlab.ca>
References: <1319471697-8970-1-git-send-email-b-cousson@ti.com>
 <20111024221916.GF4394@ponder.secretlab.ca>
 <4EA5ED35.7000806@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-omap-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4EA5ED35.7000806@ti.com>
Sender: linux-omap-owner@vger.kernel.org
To: "Cousson, Benoit" <b-cousson@ti.com>
Cc: "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 25, 2011 at 12:56:53AM +0200, Cousson, Benoit wrote:
> On 10/25/2011 12:19 AM, Grant Likely wrote:
> >In general, I'm inclined to accept this patch as we talked about at
> >plumbers.  However, this particular hunk gives me pause as there is
> >still the objection that Russell raised about the (ab)use of r->name
> >for insert the resource name.
> >
> >So, no I won't reject this patch, but I first what to have some idea
> >of what the plan is to migrate away from using r->name.  Perhaps we
> >can talk about this tomorrow.
> 
> OK, sure, let's discuss about that.
> But I still think that Russell's concern is not related at all with
> this patch. That means that it should be fixed separately if needed.
> It can be done before or after, but this is somehow orthogonal to
> the DT reg-names support problem.

Right, but this patch does add more infrastructure code manuipulating
that field, so I'd like to have a plan for fixing the problem before
committing this.

g.

