From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Device Tree Maturity Project
Date: Fri, 22 Nov 2013 15:08:13 +0000
Message-ID: <CACxGe6uOotJV-JPHJg3oG7pCUea7HxUP1e+Jp-WHOuzNonxeeQ@mail.gmail.com>
References: <CACxGe6uMqTP_pBdrpR9Tio6oErrgNmR_S9dtF7VsSig_B-rP+Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACxGe6uMqTP_pBdrpR9Tio6oErrgNmR_S9dtF7VsSig_B-rP+Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stuart Yoder <b08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?Q?Pawe=C5=82_Moll?= <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Notes from first meeting from Nov 22, 2013

Attendance: Rob Herring and Grant Likely, Stuart Yoder. Pawel Moll was
on the line, but we couldn't actually hear him.

Talked through the initial task list and noted missing bits.

Rob is concerned that the schema work is in danger of stalling because
he doesn't remember any recent activity on the list.

ABI policy: Jason Cooper started a document. Need to look over it and comment.

ACTION: Grant to follow up with Jason and want needs to be done to get
the document merged.

ePAPR: Nothing has happened since the release of v1.1 of the document.
Stuart is going to look at getting that document out from under the
click through agreement and get the new bindings we're working on
encoded into the document.

ACTION: Stuart: Follow up with Power.org on releasing the ePAPR
document for future revision.

Stuart brought up question if the memory binding had been resolved.
Maxime is working on implementation and expect to see patches in the
near future.

Overlays: Pantellis posted a new patch series recently and has
received feedback. He is doing some rework. We'll probably see a new
series in the near future.

devicetree.org: What to do with this site? Currently owned and
maintained by Grant who is the worst system administrator in the
world. The site is basically dead except for one useful document.
Should the site be resurrected or move the DT usage document off?
Stuart suggested it would be a good home for the device tree source
files when they move out of the kernel. Grant would like to find a new
home for devicetree.org, but needs a suggestion on what organization
can host it.

Schema validation: Question about whether or not to build the schemas
in C code. Rob has begun doing some rudimentary checking on compatible
strings. Is considering adding it to checkpatch. We talked about
priorities for schema validation and how it could be implemented.
Created a list of priorities as a page on the task list spreadsheet.
Rob also has an experimental script that merely checks that all
compatible strings are actually documented. He will look at wiring
that script into checkpatch. Tomasz wasn't on the call though, so the
above is little more than a brain dump. Need to follow up with Tomasz.

End of meeting, no meeting next week due to US Thanksgiving.

g.


On Wed, Nov 20, 2013 at 11:55 AM, Grant Likely
<grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> Hi all,
>
> Following up from the ARM summit in Edinburgh last month[1], there
> were a number of things identified as needing to be improved or fixed
> in short order. I've started a list of the things that are important
> to be resolved[2]. To try and avoid getting stalled and having the
> exact same discussion over again in 6 months time, I would like to
> kick of a short lived project to work through as many of them as
> possible. I think 3 months would be a good target.
>
> To help keep track of what is going on, I would like to have a short
> stand up meeting once a week. Looking at my calendar, I can make
> 14:00UTC on Tuesday, Wednesday or Friday work (9:00EST, 7:00PST). I
> know that's quite early for those of you on the American Pacific
> coast. Unfortunately I cannot reliably make any meetings after 2:45
> UTC. It can be later if someone else will volunteer to moderate the
> meetings.
>
> Anyone who wants to be involved, please email me and I'll give you
> write access to the spreadsheet[2] and add you to the meeting invite.
> Also let me know which day works best for you.
>
> g.
>
> [1] http://www.spinics.net/lists/arm-kernel/msg285148.html
> [2] https://docs.google.com/spreadsheet/ccc?key=0ArznbucQARK6dEUxbVRjME1DcUFudGQwTjZIdkMtSVE&usp=sharing
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
