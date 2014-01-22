From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [RFC] Culling traffic volume on devicetree mailing list
Date: Wed, 22 Jan 2014 10:35:58 -0800
Message-ID: <CAOesGMhYfWXCFOc6K67aAcNNRUppONY4WNXTvk2NEJH-rfMrGQ@mail.gmail.com>
References: <CACxGe6vYMOnyeqdhaAggytxgiLH=ijNOrmuq2FyOUtZCGqfdgQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACxGe6vYMOnyeqdhaAggytxgiLH=ijNOrmuq2FyOUtZCGqfdgQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 21, 2014 at 6:40 AM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> Hi everyone,
>
> Today on the devicetree conf call we (Rob, Ian and I) talked about
> culling the volume of traffic on the devicetree list so that it would
> be more useful to the DTC maintainers and non-Linux users like
> freebsd. We'd like to propose creating the following two lists so that
> those interested don't need to drink from the firehose:
>
> devicetree-compiler: Specifically for discussing dt tooling topics
> (parsing, schema validation, data format)

This makes a lot of sense, and should help to decouple the bindings
and standards from the tool. Should have happened a long time ago. :)

> devicetree-spec: For discussing 'core' device tree bindings. ie.
> anything that would be a candidate for putting into an ePAPR type
> spec. Individual device bindings would continue to be posted to
> devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, but anything affecting subsystems or
> generic patterns should be posted to this new list.

I predict that it will be hard for someone posting a patch to tell if
they should send it to this list or some other list. It might be
convenient for you guys to ignore the high-volume list and just focus
on this one, but for the people who post patches it just makes it more
complicated. IMHO.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
