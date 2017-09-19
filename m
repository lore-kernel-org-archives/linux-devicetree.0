From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] of/platform: dynamic: Use of_platform_bus_create() to
 create devices
Date: Tue, 19 Sep 2017 11:27:27 -0500
Message-ID: <CAL_JsqKKso=VF=pERqZyR-re9iyYxaFohha4nP3Z_0pohFumWQ@mail.gmail.com>
References: <b317f693-98b5-ba1e-1184-83735a68db9b@nokia.com>
 <CAL_JsqJZ__mUwRT14BmNQKaa_mAPsJm0iWP8sb6Oqs+_-Gu5hw@mail.gmail.com> <43407912-3ecd-97c7-a90a-a9cd07a4b3ae@nokia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <43407912-3ecd-97c7-a90a-a9cd07a4b3ae-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Sverdlin <alexander.sverdlin-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 19, 2017 at 10:13 AM, Alexander Sverdlin
<alexander.sverdlin-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org> wrote:
> Hello Rob,
>
> On 27/10/16 15:00, Rob Herring wrote:
>> On Thu, Oct 20, 2016 at 6:02 AM, Alexander Sverdlin
>> <alexander.sverdlin-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org> wrote:
>>> of_platform_notify() requires parents to have OF_POPULATED_BUS to be set
>>> (which is correct way to verify healthy platform bus), but uses
>>> of_platform_device_create() to create devices, which never sets the above
>>> flag. Therefore it's not possible to add platform buses via overlays.
>> Can you create a unit test case that has the problem.
>
> PING
> The tests for the highlighted problem were presented here:
> http://www.spinics.net/lists/devicetree/msg160016.html

Can you please rebase and resend these.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
