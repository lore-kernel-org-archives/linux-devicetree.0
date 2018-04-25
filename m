Return-Path: <SRS0=FSC8=HO=linaro.org=john.stultz@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20180419143804.brdgezjaxqalarum@linaro.org>
References: <20180419143804.brdgezjaxqalarum@linaro.org>
From: John Stultz <john.stultz@linaro.org>
Date: Wed, 25 Apr 2018 10:30:16 -0700
Message-ID: <CALAqxLUcHtjEix9qcSU0yF-ymKBvk8f4DjUY=ci_Hq1++twktw@mail.gmail.com>
Subject: Re: Revisiting Devicetree Overlay Manager
Content-Type: text/plain; charset="UTF-8"
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@secretlab.ca>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Dmitry Shmidt <dimitrysh@google.com>, Nicolas Dechense <nicolas.dechesne@linaro.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, Loic Poulain <loic.poulain@linaro.org>
List-ID: <devicetree@vger.kernel.org>

On Thu, Apr 19, 2018 at 7:38 AM, Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
> Hello Everyone,
>
> I have just started working on the Devicetree Overlay Manager support in
> kernel. The idea is to merge overlays at boot time specified via some
> interface like kernel command line. The motivation for this work comes from
> Overlay Manager [1] submitted by John last year. The mechanism which I have
> been working on is an extension to John's work. It focusses on addressing

Just a quick correction here: I only submitted the work last year, the
overlay manager work is all by Dmitry Shmidt.

thanks
-john
