From: Jason Hui <jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] arm/dt: add very basic dts file for babbage board
Date: Mon, 7 Mar 2011 13:06:44 +0800
Message-ID: <AANLkTimM=fskPKcaQ8QtiVJk+sxi6ueD5Yx-A3YJvkk3@mail.gmail.com>
References: <1298016730-22761-1-git-send-email-r64343@freescale.com>
	<1298016730-22761-3-git-send-email-r64343@freescale.com>
	<AANLkTikerADxGGRfnumWMN+s2r8gWOb1UAaS3tQ6DTe5@mail.gmail.com>
	<AANLkTi=kxbzDCJqOnPNjCsNxMsLtcbbcGLfZbY05_Svh@mail.gmail.com>
	<20110228143159.GA3688@S2100-06.ap.freescale.net>
	<20110228180917.GG13690@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <20110228180917.GG13690-MrY2KI0G/OVr83L8+7iqerDks+cytr/Z@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi, Grant and Shawn,

On Tue, Mar 1, 2011 at 2:09 AM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wr=
ote:
> On Mon, Feb 28, 2011 at 10:32:01PM +0800, Shawn Guo wrote:
>> Hi Grant,
>>
>> On Mon, Feb 21, 2011 at 10:10:24AM -0700, Grant Likely wrote:
>> > On Mon, Feb 21, 2011 at 2:46 AM, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrot=
e:
>> [...]
>> > >> + =A0 =A0 =A0 clocks {
>>
>> Do we already have a clock binding specification, which is followed
>> by this example? =A0Or the properties given here still can be discussed
>> and open to change?
>>
>> Also to support dynamically creating and registering 'struct clk' per
>> dt clock nodes, I need to add a few properties to map stuff like
>> parent 'struct clk', con_id of 'struct clk_lookup'. =A0Is there any
>> specification to follow, or I can draft it per the needs of my work?
>
> The clock specifications are still in draft. =A0I'm not willing to lock
> down on a binding until we've got some real implementations to back
> them up. =A0If you need additional properties, go ahead an propose them.
>
> Keep in mind when defining/extending bindings, that the dt is intended
> to represent hardware layout, not Linux kernel internal implementation
> details. =A0Try to avoid describing things in a linux-specific way.

I will consider all your review comments and come up with V2 patch soon.

>
> _______________________________________________
> linaro-dev mailing list
> linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
> http://lists.linaro.org/mailman/listinfo/linaro-dev
>
