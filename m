From: Laszlo Ersek <lersek@redhat.com>
Subject: Re: [Qemu-devel] QEMU fw_cfg DMA interface
Date: Thu, 1 Oct 2015 18:34:56 +0200
Message-ID: <560D60B0.5000902@redhat.com>
References: <1443701677-13629-1-git-send-email-markmb@redhat.com>
 <560D5945.5050700@redhat.com> <560D5C7E.8080900@redhat.com>
 <560D5DA1.90607@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <560D5DA1.90607@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Eric Blake <eblake@redhat.com>, =?UTF-8?Q?Marc_Mar=c3=ad?= <markmb@redhat.com>, linux-kernel@vger.kernel.org, qemu-devel@nongnu.org, seabios@seabios.org
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <rob.herring@linaro.org>, Drew <drjones@redhat.com>, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, Stefan Hajnoczi <stefanha@gmail.com>, Alexander Graf <agraf@suse.de>, Kevin O'Connor <kevin@koconnor.net>, Gerd Hoffmann <kraxel@redhat.com>
List-Id: devicetree@vger.kernel.org

On 10/01/15 18:21, Eric Blake wrote:
> On 10/01/2015 10:17 AM, Laszlo Ersek wrote:
>> On 10/01/15 18:03, Eric Blake wrote:
>>> [meta-comment]
>>>
>>> On 10/01/2015 06:14 AM, Marc Mar=C3=AD wrote:
>>>> Implementation of the FW CFG DMA interface.
>>>
>>> The subject line is missing "v4" and "0/7". Also, the cover letter =
is
>>> missing a diffstat.  That makes it harder to see from the cover let=
ter
>>> what the rest of the series is about.  'git format-patch/send-email
>>> --cover-letter' does what you want; you can even 'git config
>>> format.coverletter=3Dauto' to always include a decent cover letter =
on any
>>> multi-patch series.
>>>
>>
>> This posting follows a little bit different pattern, one that I myse=
lf
>> follow when posting patches for two (or more) components that must w=
ork
>> in sync.
>=20
> Ok, makes sense. Maybe the only additional suggestions would be to ma=
ke
> it more obvious in the subject line (put the text 'cross-post'
> somewhere?) or have the first paragraph of the meta-cover be more
> explicit that there are going to be multiple sub-threads, one per
> project, where all subthreads must be applied to their corresponding
> project for the overall feature to be complete?

That's a good idea. I think prefixing the main blurb's subject with
[cross-post], and a "standard" first paragraph based on your above
suggestion, would be helpful.

> [And maybe I should wait a few minutes for the full thread to appear =
in
> my inbox, rather than immediately replying to the first mail while th=
e
> series is still incomplete due to mail delays...]

I'm not patient; it would be unfair from me to expect others to be... :=
)

Laszlo
