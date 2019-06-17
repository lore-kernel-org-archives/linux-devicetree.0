From: Johannes Berg <johannes@sipsolutions.net>
Subject: Re: [PATCH v2 00/17] net: introduce Qualcomm IPA driver
Date: Mon, 17 Jun 2019 13:28:39 +0200
Message-ID: <066e9b39f937586f0f922abf801351553ec2ba1d.camel@sipsolutions.net>
References: <380a6185-7ad1-6be0-060b-e6e5d4126917@linaro.org>
 <a94676381a5ca662c848f7a725562f721c43ce76.camel@sipsolutions.net>
 <CAK8P3a0kV-i7BJJ2X6C=5n65rSGfo8fUiC4J_G-+M8EctYKbkg@mail.gmail.com>
 (sfid-20190611_135708_651569_0097B773)
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAK8P3a0kV-i7BJJ2X6C=5n65rSGfo8fUiC4J_G-+M8EctYKbkg@mail.gmail.com>
 (sfid-20190611_135708_651569_0097B773)
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: DTML <devicetree@vger.kernel.org>, syadagir@codeaurora.org, Eric Caruso <ejcaruso@google.com>, Dan Williams <dcbw@redhat.com>, linux-arm-msm@vger.kernel.org, abhishek.esse@gmail.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, evgreen@chromium.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Alex Elder <elder@linaro.org>, Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>, Networking <netdev@vger.kernel.org>, linux-soc@vger.kernel.org, David Miller <davem@davemloft.net>, cpratapa@codeaurora.org, Ben Chan <benchan@google.com>
List-Id: devicetree@vger.kernel.org

On Tue, 2019-06-11 at 13:56 +0200, Arnd Bergmann wrote:
> On Tue, Jun 11, 2019 at 10:12 AM Johannes Berg
> <johannes@sipsolutions.net> wrote:
> 
> > > As I've made clear before, my work on this has been focused on the IPA transport,
> > > and some of this higher-level LTE architecture is new to me.  But it
> > > seems pretty clear that an abstracted WWAN subsystem is a good plan,
> > > because these devices represent a superset of what a "normal" netdev
> > > implements.
> > 
> > I'm not sure I'd actually call it a superset. By themselves, these
> > netdevs are actually completely useless to the network stack, AFAICT.
> > Therefore, the overlap with netdevs you can really use with the network
> > stack is pretty small?
> 
> I think Alex meant the concept of having a type of netdev with a generic
> user space interface for wwan and similar to a wlan device, as I understood
> you had suggested as well, as opposed to a stacked device as in
> rmnet or those drivers it seems to be modeled after (vlan, ip tunnel, ...)/.

I guess. It is indeed currently modelled after the stacked devices, but
those regular netdevs are inherently useful by themselves, you don't
*have* to tunnel or use VLANs after all.

With rmnet, the underlying netdev *isn't* useful by itself, because
you're always forced to have the stacked rmnet device on top.


> > > HOWEVER I disagree with your suggestion that the IPA code should
> > > not be committed until after that is all sorted out.  In part it's
> > > for selfish reasons, but I think there are legitimate reasons to
> > > commit IPA now *knowing* that it will need to be adapted to fit
> > > into the generic model that gets defined and developed.  Here
> > > are some reasons why.
> > 
> > I can't really argue with those, though I would point out that the
> > converse also holds - if we commit to this now, then we will have to
> > actually keep the API offered by IPA/rmnet today, so we cannot actually
> > remove the netdev again, even if we do migrate it to offer support for a
> > WWAN framework in the future.
> 
> Right. The interface to support rmnet might be simple enough to keep
> next to what becomes the generic interface, but it will always continue
> to be an annoyance.

Not easily, because fundamentally it requires an underlying netdev to
have an ifindex, so it wouldn't just be another API to keep around
(which I'd classify as an annoyance) but also a whole separate netdev
that's exposed by this IPA driver, for basically this purpose only.

> > I dunno if it really has to be months. I think we can cobble something
> > together relatively quickly that addresses the needs of IPA more
> > specifically, and then extend later?
> > 
> > But OTOH it may make sense to take a more paced approach and think
> > about the details more carefully than we have over in the other thread so far.
> 
> I would hope that as soon as we can agree on a general approach, it
> would also be possible to merge a minimal implementation into the kernel
> along with IPA. Alex already mentioned that IPA in its current state does
> not actually support more than one data channel, so the necessary
> setup for it becomes even simpler.

Interesting, I'm not even sure how the driver can stop multiple channels
in the rmnet model?

> At the moment, the rmnet configuration in include/uapi/linux/if_link.h
> is almost trivial, with the three pieces of information needed being
> an IFLA_LINK to point to the real device (not needed if there is only
> one device per channel, instead of two), the IFLA_RMNET_MUX_ID
> setting the ID of the muxing channel (not needed if there is only
> one channel ?), a way to specify software bridging between channels
> (not useful if there is only one channel) 

I think the MUX ID is something we *would* want, and we'd probably want
a channel type as well, so as to not paint ourselves into a corner where
the default ends up being whatever IPA supports right now.

The software bridging is very questionable to start with, I'd advocate
not supporting that at all but adding tracepoints or similar if needed
for debugging instead.


> and a few flags that I assume
> must match the remote end:
> 
> #define RMNET_FLAGS_INGRESS_DEAGGREGATION         (1U << 0)
> #define RMNET_FLAGS_INGRESS_MAP_COMMANDS          (1U << 1)
> #define RMNET_FLAGS_INGRESS_MAP_CKSUMV4           (1U << 2)
> #define RMNET_FLAGS_EGRESS_MAP_CKSUMV4            (1U << 3)

I don't really know about these.

> > If true though, then I think this would be the killer argument *in
> > favour* of *not* merging this - because that would mean we *don't* have
> > to actually keep the rmnet API around for all foreseeable future.
> 
> I would agree with that. From the code I can see no other driver
> including the rmnet protocol header (see the discussion about moving
> the header to include/linux in order to merge ipa), and I don't see
> any other driver referencing ETH_P_MAP either. My understanding
> is that any driver used by rmnet would require both, but they are
> all out-of-tree at the moment.

I guess that would mean we have more work to do here, but it also means
we don't have to support these interfaces forever.

I'm not *entirely* convinced though. rmnet in itself doesn't really seem
to require anything from the underlying netdev, so if there's a driver
that just blindly passes things through to the hardware expecting the
right configuration, we wouldn't really see it this way?

OTOH, such a driver would probably blow up completely if somebody tried
to use it without rmnet on top, and so it would at least have to check
for ETH_P_MAP?

johannes
