From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC v2 PATCH 11/14] Documentation: Add st_magn binding documentation
Date: Tue, 22 Oct 2013 07:55:29 +0100
Message-ID: <CAF2Aj3iZT5J=UQNFahZy2Vngst8mfxGDoV7B0Q6gQNsq2Xg-aw@mail.gmail.com>
References: <1380299538-22047-1-git-send-email-l.czerwinski@samsung.com>
	<1380299538-22047-12-git-send-email-l.czerwinski@samsung.com>
	<524AF86D.7010200@kernel.org>
	<524AEEFC.8010201@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <524AEEFC.8010201-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lukasz Czerwinski <l.czerwinski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org, Denis Ciocca <denis.ciocca-qxv4g6HH51o@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 1 October 2013 16:49, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 10/01/2013 11:29 AM, Jonathan Cameron wrote:
>> On 09/27/13 17:32, Lukasz Czerwinski wrote:
>>> This patch adds the document for STMicroeletronics Magnetic Sensors=
 driver under
>>> Documentation/devicetree/bindings/iio/.
>>>
>>> Signed-off-by: Lukasz Czerwinski <l.czerwinski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>> Signed-off-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>> ---
>>
>> So right now we have two different approaches to documenting these b=
indings.  Lee
>> proposed doing it on a per device name, here you are proposing a sin=
gle file
>> per type.
>>
>> What is the prefered approach?
>>
>> Lee/Lukasz why would you two favour one way or the other?
>>
>> Device tree maintainers, which is preferred?
>
> If the only difference is compatible string, then I think one doc is
> fine and preferred by me.

I have no strong feelings either way.

--=20
Lee Jones
Linaro ST Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
