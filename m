From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH] dt: add empty of_alias_get_id() for non-dt builds
Date: Wed, 2 Nov 2011 09:20:11 -0400
Message-ID: <CACxGe6vepsvk=7DK0-4O=TD3g4qKT_TGZV_iUGLEBX6XV8Y6fw@mail.gmail.com>
References: <1319706448-1664-1-git-send-email-nicolas.ferre@atmel.com>
 <4EAAABF6.50803@gmail.com> <20111029114905.GA22592@ponder.secretlab.ca> <20111102070042.GA7136@game.jcrosoft.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20111102070042.GA7136@game.jcrosoft.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Cc: Rob Herring <robherring2@gmail.com>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 2, 2011 at 3:00 AM, Jean-Christophe PLAGNIOL-VILLARD
<plagnioj@jcrosoft.com> wrote:
> On 13:49 Sat 29 Oct =A0 =A0 , Grant Likely wrote:
>> On Fri, Oct 28, 2011 at 08:19:50AM -0500, Rob Herring wrote:
>> > On 10/27/2011 04:07 AM, Nicolas Ferre wrote:
>> > > Add function of_alias_get_id() reporting -ENOSYS
>> > > for non-dt builds, so that drivers migrating to dt
>> > > can save some '#ifdef CONFIG_OF'.
>> > >
>> > > Signed-off-by: Nicolas Ferre <nicolas.ferre@atmel.com>
>> >
>> > Acked-by: Rob Herring <rob.herring@calxeda.com>
>>
>> Merged, thanks
>>
>> Rob, for stuff like this, please do pick it up into your git tree an=
d
>> reply saying that you've done so. =A0Then I know I can ignore it bec=
ause
>> I'll be receiving a pull req from you in short order.
>>
>> Similarly, I reply whenever I pick up a patch, so you'll know if I'v=
e
>> already delt with it.
> this is still missing in the mainline kernel
>
> the at91 ends broken can one of you send a pull with it to Linus

The pull req will be going out soon.

g.
