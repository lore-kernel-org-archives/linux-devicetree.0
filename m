From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [RFC PATCH dtc] C-based DT schema checker integrated into dtc
Date: Thu, 31 Oct 2013 15:13:46 -0600
Message-ID: <5272C80A.7070204@wwwdotorg.org>
References: <1382651488-9696-1-git-send-email-swarren@wwwdotorg.org> <20131024234340.ADF70C403B6@trevor.secretlab.ca> <526A83B9.30800@wwwdotorg.org> <20131028101737.GC15114@voom.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131028101737.GC15114-RXTfZT5YzpxwFLYp8hBm2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Benoit Cousson <bcousson-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, fparent-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, jdl-CYoMK+44s/E@public.gmane.org, Alison_Chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 10/28/2013 04:17 AM, David Gibson wrote:
> On Fri, Oct 25, 2013 at 03:44:09PM +0100, Stephen Warren wrote:
>> On 10/25/2013 12:43 AM, Grant Likely wrote:
>>> On Thu, 24 Oct 2013 22:51:28 +0100, Stephen Warren
>>> <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
>>>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>> 
>>>> This is a very quick proof-of-concept re: how a DT schema
>>>> checker might look if written in C, and integrated into dtc.
>>> 
>>> Thanks for looking at this.
>>> 
>>> Very interesting. Certainly an expedient way to start checking
>>> schemas, and for certain bindings it may be the best approach.
>>> The downside is it forces a recompilation of DTC to bring in
>>> new bindings and it isn't a great meduim for mixing schema with
>>> documentation in the bindings.
>> 
>> This approach would certainly require recompiling something. I
>> threw the code into dtc simply because it was the easiest
>> container for the demonstration. It could be a separate DT
>> validation utility if we wanted, although we'd need to split the
>> DT parser from dtc into a library to avoid code duplication. The
>> resultant utility could be part of the repo containing the DTs,
>> so it didn't end up as a separate package to manage.
>> 
>> I think the additional documentation could be added as comments
>> in the validation functions, just like IIRC it was to be
>> represented as comments even in the .dts-based schema proposals.
> 
> Fwiw, I've been starting to do some hacking on the checks code,
> with a view to making it accomodate the schema stuff better.
> Branch 'checking' on the kernel.org tree.  In a state of flux, so
> expect rebases.

Did you forget to push that? I don't see it in any of:
git://git.kernel.org/pub/scm/linux/kernel/git/jdl/dtc.git
git://git.kernel.org/pub/scm/utils/dtc/dtc.git
git://git.jdl.com/software/dtc.git

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
