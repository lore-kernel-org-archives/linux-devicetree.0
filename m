From: Johannes Berg <johannes@sipsolutions.net>
Subject: Re: [PATCH v2 00/17] net: introduce Qualcomm IPA driver
Date: Tue, 11 Jun 2019 10:12:43 +0200
Message-ID: <a94676381a5ca662c848f7a725562f721c43ce76.camel@sipsolutions.net>
References: <380a6185-7ad1-6be0-060b-e6e5d4126917@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <380a6185-7ad1-6be0-060b-e6e5d4126917@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: elder@linaro.org
Cc: abhishek.esse@gmail.com, arnd@arndb.de, benchan@google.com, bjorn.andersson@linaro.org, cpratapa@codeaurora.org, davem@davemloft.net, dcbw@redhat.com, devicetree@vger.kernel.org, ejcaruso@google.com, evgreen@chromium.org, ilias.apalodimas@linaro.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-soc@vger.kernel.org, netdev@vger.kernel.org, subashab@codeaurora.org, syadagir@codeaurora.org
List-Id: devicetree@vger.kernel.org

Hi Alex, all,

> > Exactly correct.  This is what Johannes is discussing in his "cellular
> > modem APIs - take 2" thread about how this should all be organized at
> > the driver level and I think we should figure that out before we commit
> > to IPA-with-a-useless-netdev that requires rmnets to be created on top.
> > That may end up being the solution but let's have that discussion.
> 
> I looked at Johannes' message and the follow-on discussion.

Thanks :-)

Sorry also, Dan had pointed me to this thread and the discussion, but I
was travelling last week and not very reachable.

> As I've
> made clear before, my work on this has been focused on the IPA transport,
> and some of this higher-level LTE architecture is new to me.  But it
> seems pretty clear that an abstracted WWAN subsystem is a good plan,
> because these devices represent a superset of what a "normal" netdev
> implements.

I'm not sure I'd actually call it a superset. By themselves, these
netdevs are actually completely useless to the network stack, AFAICT.
Therefore, the overlap with netdevs you can really use with the network
stack is pretty small?

> HOWEVER I disagree with your suggestion that the IPA code should
> not be committed until after that is all sorted out.  In part it's
> for selfish reasons, but I think there are legitimate reasons to
> commit IPA now *knowing* that it will need to be adapted to fit
> into the generic model that gets defined and developed.  Here
> are some reasons why.

I can't really argue with those, though I would point out that the
converse also holds - if we commit to this now, then we will have to
actually keep the API offered by IPA/rmnet today, so we cannot actually
remove the netdev again, even if we do migrate it to offer support for a
WWAN framework in the future.

> Second, the IPA code has been out for review recently, and has been
> the subject of some detailed discussion in the past few weeks.  Arnd
> especially has invested considerable time in review and discussion.
> Delaying things until after a better generic model is settled on
> (which I'm guessing might be on the order of months)


I dunno if it really has to be months. I think we can cobble something
together relatively quickly that addresses the needs of IPA more
specifically, and then extend later?

But OTOH it may make sense to take a more paced approach and think about
the details more carefully than we have over in the other thread so far.

> Third, having the code upstream actually means the actual requirements
> for rmnet-over-IPA are clear and explicit.  This might not be a huge
> deal, but I think it's better to devise a generic WWAN scheme that
> can refer to actual code than to do so with assumptions about what
> will work with rmnet (and others).  As far as I know, the upstream
> rmnet has no other upstream back end; IPA will make it "real."

Is that really true? I had previously been told that rmnet actually does
have use with a few existing drivers.


If true though, then I think this would be the killer argument *in
favour* of *not* merging this - because that would mean we *don't* have
to actually keep the rmnet API around for all foreseeable future.


> I support the idea of developing a generic WWAN framework, and I
> can assure you I'll be involved enough to perhaps be one of the
> first to implement a new generic scheme.

Thanks!

johannes
