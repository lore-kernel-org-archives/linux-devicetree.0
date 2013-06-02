From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v2] video: simplefb: add mode parsing function
Date: Sat, 1 Jun 2013 22:09:04 -0700
Message-ID: <CAOesGMi=f=2S9y96-DtBzOZydhsJ1pF+m26AzdQjj59qtQu-oA@mail.gmail.com>
References: <1369626821-28494-1-git-send-email-acourbot@nvidia.com>
 <51A42ED5.2060104@wwwdotorg.org>
 <20130601051223.GB5189@quad.lixom.net>
 <51AAD326.4040809@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <51AAD326.4040809-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Clark <robclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Jun 1, 2013 at 10:07 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> On 05/31/2013 11:12 PM, Olof Johansson wrote:
>> On Mon, May 27, 2013 at 10:13:09PM -0600, Stephen Warren wrote:
>>> On 05/26/2013 09:53 PM, Alexandre Courbot wrote:
>>>> The naming scheme of simplefb's mode is precise enough to allow building
>>>> the mode structure from it instead of using a static list of modes. This
>>>> patch introduces a function that does this. In case exotic modes that
>>>> cannot be represented from their name alone are needed, the static list
>>>> of modes is still available as a backup.
> ...
>>> As such, we should either:
>>>
>>> a) Just add new entries into the format array that already exists in the
>>> driver. Given David's response, this might be simplest.
>>
>> I think so too. Is this even needed? Do we have any users of the newer formats
>> or is it just someone trying to feature-creep this driver to make the "simple"
>> part of the name inaccurate? :)
>
> Alex is working on board support for a new NVIDIA board, where IIRC the
> bootloader sets up some 32-bit ARGB format for the panel.

Ah, ok. Let's just implement that one format too then. :)


-Olof
