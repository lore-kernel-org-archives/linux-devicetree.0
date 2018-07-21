Return-Path: <SRS0=xg1F=KF=gmail.com=shubhrajyoti.datta@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20180721063629.GA30240@kroah.com>
References: <1531892462-11085-1-git-send-email-shubhrajyoti.datta@xilinx.com> <20180721063629.GA30240@kroah.com>
From: Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Date: Sat, 21 Jul 2018 17:22:03 +0530
Message-ID: <CAKfKVtHqF_dPLjLJ7STxY0WKREDfcMYmH8=6YFM-+uHiiDtCgg@mail.gmail.com>
Subject: Re: [PATCHv4 1/4] tty: serial: uartlite: Add structure for private data
Content-Type: text/plain; charset="UTF-8"
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>, linux-serial@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Tanvi Desai <tanvi.desai@xilinx.com>
List-ID: <devicetree@vger.kernel.org>

Hi Greg,

On Sat, Jul 21, 2018 at 12:06 PM, Greg KH <gregkh@linuxfoundation.org> wrote:
> On Wed, Jul 18, 2018 at 11:10:59AM +0530, Shubhrajyoti Datta wrote:
>> Add struct uartlite_data, to store the private data of the Uartlite
>> driver.
>>
>> Signed-off-by: Tanvi Desai <tanvi.desai@xilinx.com>
>> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
>> ---
>>  drivers/tty/serial/uartlite.c | 29 +++++++++++++++++++++--------
>>  1 file changed, 21 insertions(+), 8 deletions(-)
>
> You have a bunch of patches here, all mis-marked with v3 and v4 in the
> same series.  and as a stand-alone series.  and as an individual patch.
>
> I have no idea what is going on here at all, so I'm deleting them all
> from my queue.  Please be more careful and properly version the whole
> series when resending things.
>
> Also, you need to document what changed in each version, I don't see
> that here either :(
>
> thanks,
I have resent the series in v5 .
>
> greg k-h
