From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] ARM: vexpress: initial device tree support
Date: Wed, 21 Sep 2011 08:57:46 -0600
Message-ID: <CACxGe6sTYYXbpXvPb4C+y4JX0eRxLvwjbFycXA8Mjc-XWS1QUA@mail.gmail.com>
References: <1316596786-2539-1-git-send-email-dave.martin@linaro.org>
	<4E79E588.6010703@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4E79E588.6010703-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Dave Martin <dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, =?UTF-8?Q?Pawe=C5=82_Moll?= <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-CfjtxxwdHycX+EX/Zwu52A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 21, 2011 at 7:24 AM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 09/21/2011 04:19 AM, Dave Martin wrote:
>> =A0 =A0 =A0 * arm,amba-bus -- widely used by other boards and patchsets,=
 but
>> =A0 =A0 =A0 =A0 seems not to be documented.
>>
>
> This should be dropped. There's not really any bus component to an amba
> bus. All the probing info is within the primecell peripherals.

No, if it is an AMBA bus, then it is entirely appropriate to declare
it as an amba bus, but to also be compatible with "simple-bus".  In
fact, it would be better to use a compatible string that specifies the
specific implementation of AMBA bus since there are several versions
of the spec.

Don't let Linux's current implementation detail derail what is
considered good practice.

g.
