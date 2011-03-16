From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH V4 1/5] arm/dt: add basic mx51 device tree support
Date: Tue, 15 Mar 2011 23:03:55 -0600
Message-ID: <AANLkTimE7iWuCf8BMVMjNYxxosnrzSbRg7P1mULAe=5W@mail.gmail.com>
References: <1299733185-2172-1-git-send-email-jason.hui@linaro.org>
	<1299733185-2172-2-git-send-email-jason.hui@linaro.org>
	<20110315070342.GB23050@angua.secretlab.ca>
	<AANLkTimJUcsAc6Y2nf7fMWu=H1JW9ybrWZMtP3swWsu=@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <AANLkTimJUcsAc6Y2nf7fMWu=H1JW9ybrWZMtP3swWsu=@mail.gmail.com>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Jason Hui <jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 15, 2011 at 9:34 PM, Jason Hui <jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> Hi, Grant,
>
> On Tue, Mar 15, 2011 at 3:03 PM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>=
 wrote:
>> Hi Jason,
>>
>> Minor comments below.
>>
>> On Thu, Mar 10, 2011 at 12:59:41PM +0800, Jason Liu wrote:
>>> Signed-off-by: Jason Liu <jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>> Signed-off-by: Jason Liu <r64343-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>>
>> This looks wrong. =A0You should only have one s-o-b line. =A0Use one ema=
il
>> addr or the other. =A0Not both.
>
> I just take the same approach as this link: https://lkml.org/lkml/2010/12=
/17/363
> If you think it's not applicable, I can change it.

Yeah, I don't think that's right.  A s-o-b is a personal assertion
that the patch is to the best of your knowledge that you have the
right to submit it for inclusion in the kernel (see section 12 of
Documentation/SubmittingPatches).  It doesn't make any statements
about who owns the copyright on the patch or other issues of corporate
ownership.  Companies may have policies about which email address
employees use when signing off, but that isn't what the s-o-b protocol
is for.

Since there isn't more than one of you, you should only have one s-o-b
line.  :-)

Paul, since your email was presented as evidence, would you care to
offer a counter-argument?  :-)

g.


-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
