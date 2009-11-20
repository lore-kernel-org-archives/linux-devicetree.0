From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC PATCH 1/5] Rework OpenFirmware GPIO handling
Date: Fri, 20 Nov 2009 14:12:37 -0700
Message-ID: <fa686aa40911201312v3d8b004bu4845e4b9978796e5@mail.gmail.com>
References: <1258472546-31343-1-git-send-email-dbaryshkov@gmail.com>
	<1258472546-31343-2-git-send-email-dbaryshkov@gmail.com>
	<fa686aa40911201237y4a41dd63wee3fb4e0a5858e87@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <fa686aa40911201237y4a41dd63wee3fb4e0a5858e87-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Anton Vorontsov <avorontsov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org>, David Brownell <dbrownell-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 20, 2009 at 1:37 PM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> w=
rote:
> On Tue, Nov 17, 2009 at 8:42 AM, Dmitry Eremin-Solenikov
> <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> This patch improves OF GPIO bindings so, that most non-OF-specific gpio
>> controllers don't need to call any of OF binding function:
>>
>> 0) Move of_gpio_chip into main gpio_chip structure.
>> 1) Call of_gpio_init/destroy from gpiochip_add/remove.
>> 2) By default supply reasonable defaults for gpio_cells/xlate
>
> I think this change approaches the problem from the wrong way around.
> It is not appropriate to try and build OF hooks into gpiolib. gpiolib
> should be completely agnostic to any layers around them used to get
> data about how they are configured up. =A0If anything, OF helpers should
> wrap around the gpiolib functions so that drivers can use them if it
> is useful to do so.

Hmmm... okay, I didn't read your patch closely enough the first time
around.  I understand what you're trying to do now.  I appreciate
wanting to make GPIO binding transparent to GPIO providers.  However,
I'm still leery of inserting OF hooks into gpiolib.  I'm not convinced
that it is the correct approach.  What *might* work is to add a
notifier API to GPIOLIB so that interested subsystems (like OF) can
register hooks to be told when GPIO pins are added and removed.  That
keeps things all the OF implementation details abstracted away from
gpiolib.

Cheers,
g.
