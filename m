From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] dtc: Remove spurious output on stderr
Date: Wed, 11 Apr 2012 16:17:03 -0700
Message-ID: <CAPnjgZ02qPGCOacC1fN+A6PE6McqL_CL9nerQ5RXkhvZVwcsGw@mail.gmail.com>
References: <1334170516-23473-1-git-send-email-sjg@chromium.org>
 <20120411224557.GA8024@truffala.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120411224557.GA8024-MK4v0fQdeXQXU02nzanrWNbf9cGiqdzd@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi David,

On Wed, Apr 11, 2012 at 3:45 PM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Wed, Apr 11, 2012 at 11:55:16AM -0700, Simon Glass wrote:
>> Outputing to stderr is best avoided unless there is an error or warning =
to
>> display. At present dtc always displays the name of the file it is compi=
ling
>> and the input/output formats. For example:
>>
>> DTC: dts->dts =A0on file "-"
>>
>> This can cause problems in some build systems. For example, U-Boot shows
>> build errors for any boards which use dtc at present. It is typically the
>> only message output during such a build. The C compiler does not output
>> anything in general. The current dtc behaviour makes it difficult to
>> provide a silent build in the normal case where nothing went wrong.
>>
>> The -q flag is currently used to ignore warnings, and this message is not
>> really a warning. If we inserted another level of quietness that just
>> supresses non-warnings, then this would break the current behaviour of -=
q.
>>
>> Therefore a new flag seems appropriate. Unfortunately both -v and -V are
>> already used, so I have come up with the random choice of -a: "announce
>> operation".
>>
>> This also changes current behaviour, but hopefully in a good way. The ma=
in
>> problem is that people will wonder whether dtc actually ran at all, since
>> they are used to seeing the message. A quick check should confirm this, =
or
>> the -a flag can be added if desired.
>>
>> I'm hoping someone has a better solution.
>
> Ugh. =A0Don't bother with the option, just remove the message. =A0I've
> been half meaning to get rid of it for ages.

:-) That's not the answer I expected. Will do.

>
> --
> David Gibson =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| I'll have my music =
baroque, and my code
> david AT gibson.dropbear.id.au =A0| minimalist, thank you. =A0NOT _the_ _=
other_
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| _way_ _a=
round_!
> http://www.ozlabs.org/~dgibson

Regards
Simon
