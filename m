From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [patch] of: check for IS_ERR()
Date: Fri, 26 Feb 2010 09:11:46 -0700
Message-ID: <fa686aa41002260811p23c86396wcbcd4a32daf504b5@mail.gmail.com>
References: <20100226094941.GE4912@bicker>
	<20100226.015420.66646406.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20100226.015420.66646406.davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
Cc: error27-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jezz-kPcTzGkeZgAdnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, afleming-KZfg59tc24xl57MIdRCFDg@public.gmane.org, jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Feb 26, 2010 at 2:54 AM, David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org> wrote:
> From: Dan Carpenter <error27-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Date: Fri, 26 Feb 2010 12:49:41 +0300
>
>> get_phy_device() can return an ERR_PTR()
>>
>> Signed-off-by: Dan Carpenter <error27-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>> I don't have a cross compile environment set up so I can't even compile
>> test this. =A0:/ =A0But err.h is included so it should be OK.
>
> It should return ERR_PTR() consistently. =A0Checking for both
> NULL and ERR_PTR() is undesirable.

Ugh.  This is why I dislike the ERR_PTR() pattern so much.  The
compiler cannot do any type checking and it is implemented
inconsistently.  You have to go look at the calling function to find
out what you're allowed to do with the return value.  ie. which test
do I use? (!ptr) or IS_ERR(ptr)?

It would be better if ERR_PTR() returned a structure or a union.  At
least that way the compiler would yell at you if the an ERR_PTR was
being returned.

g.

-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
