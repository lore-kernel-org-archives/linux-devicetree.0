From: Brian Austin <brian.austin-jGc1dHjMKG3QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH RFC] dt: bindings: submitting patches document
Date: Thu, 7 Nov 2013 09:26:47 -0600
Message-ID: <alpine.DEB.2.10.1311070921040.27693@heelrod.ad.cirrus.com>
References: <1383759120-21571-1-git-send-email-jason@lakedaemon.net> <527B7C94.7030708@atmel.com> <20131107115604.GJ8308@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"; format=flowed
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131107115604.GJ8308-u4khhh1J0LxI1Ri9qeTfzeTW4wlIGRCZ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 7 Nov 2013, Jason Cooper wrote:

> On Thu, Nov 07, 2013 at 12:42:12PM +0100, Nicolas Ferre wrote:
>> On 06/11/2013 18:32, Jason Cooper :
>>> Signed-off-by: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
>>> ---
>>> All,
>>>
>>> Since I've now had to answer this question a couple of times, I thought it
>>> might be worth trying to put it in a document.  I don't like long documents, so
>>> this is pretty concise, and most likely wrong.  Hence, RFC.  :)
>>>
>>> I also dislike quoting people from my imperfect memory, much better to have an
>>> agreed upon document we can point people towards.
>>>
>>> thx,
>>>
>>> Jason.
>>>
>>>  .../devicetree/bindings/submitting-patches.txt     | 52 ++++++++++++++++++++++
>>>  1 file changed, 52 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/submitting-patches.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/submitting-patches.txt b/Documentation/devicetree/bindings/submitting-patches.txt
>>> new file mode 100644
>>> index 000000000000..5a84d5ebb0f5
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/submitting-patches.txt
>>> @@ -0,0 +1,52 @@
>>> +
>>> +  Submitting devicetree (DT) binding patches
>>> +
>>> +I. For patch submitters
>>> +
>>> +  0) Normal patch submission rules from Documentation/SubmittingPatches
>>> +     applies.
>>> +
>>> +  1) The Documentation/ portion of the patch should be a separate patch
>>> +     and clearly labelled as such.  For example:
>>> +
>>> +       [PATCH X/Y] dt: binding: mvebu mbus driver
>>> +
>>> +     This makes the binding portion easy to find among large patch series.
>>> +
>>> +  2) Submit the entire series to the devicetree mailinglist at
>>
>> This is not what I understood.
>> It seems that we said that only the patch that was containing the
>> binding documentation have to be sent to the devicetree
>> mainling-list (but this patch being part of a patch series anyway).
>> This way the devicetree maintainers would not have to deal with the
>> patch review process, even if they can have a look to the code
>> source on the mailing-list archive if they need to.
>
> And that is the exact reason I wrote this doc.  ;-)  Mark Rutland said
> on Friday during the Q&A portion of the DT talk that he wanted to be
> able to refer to the code changes that went with the binding doc patch.
>
> I raised my hand and pointed to the elephant in the room, that this was
> the exact opposite of what was decided during the mini-summit.  Grant
> said to send the whole series since he has better filters now for
> finding the binding documentation changes.
>
> Since he isn't the only reviewer, I came up with the 'dt: binding: ...'
> subject line to make the patch easier to find and review.
>

This sounds reasonable to me.  I submit a 3 series patch to ASoC for new 
DT support and have '[PATCH 3/3]dt: binding:' for the binding file and 
send the whole series to the DT and ASoC mailing lists.

It doubles the email for a patch, but if they can be filtered does it 
matter?

I will be sending one shortly so I guess I'll do that and see what 
happens.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
