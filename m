From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v4 2/6] Add fdt read/write utility functions
Date: Thu, 22 Sep 2011 09:31:21 -0700
Message-ID: <CAPnjgZ2H0ZE9dk_6QtXc1LXHqgc_D42QZGc8SHEH_8EBvP+jzw@mail.gmail.com>
References: <1316637169-24112-1-git-send-email-sjg@chromium.org>
	<1316637169-24112-3-git-send-email-sjg@chromium.org>
	<E1R6lGT-00088u-Jr@jdl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <E1R6lGT-00088u-Jr-CYoMK+44s/E@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Jon,

On Thu, Sep 22, 2011 at 8:32 AM, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org> wrote:
>> This adds higher-level libfdt operations for reading/writing an fdt
>> blob from/to a file, as well s a function to decode a data type string
>> as will be used by fdtget, fdtput.
>>
>> Add utilfdt tests
>>
>> This adds a few tests for the simple type argument supported by
>> utilfdt_decode_type.
>>
>> I assume this will be squashed in with utilfdt, but I have left it out
>> for easier review here.
>>
>> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>
>
> Simon,
>
> I'm willing to apply patches 2, 3 and 4 of this series as well,
> but 'git --3way am <mail>' has groused that the patch looks
> corrupted or hand edited and doesn't apply to any blob in my tree.
>
> Bummer.
>
> Any chance you could rebase on to current top? =A0I've added a
> patch or two from Anton, and your 1/6 from this series.
>

Of course, I should have done it yesterday before I sent the patch
set, as I am now changing util.c instead of adding my own file.  I
will rebase and send a new version, and also tidy up David's comments
re commit msg.

Regards,
Simon

> Thanks,
> jdl
>
