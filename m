From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 2/3] devantech-srf04.yaml: add Maxbotix ultrasonic iio
 proximity sensors
Date: Sun, 14 Apr 2019 14:08:29 +0100
Message-ID: <20190414140829.5c4dfcbb@archlinux>
References: <20190409191054.va6y2l5lyhyoo5p4@arbad>
        <CAL_Jsq+k+JDsm=3cX6UeRCyD4k1YnWxbkoYm49GMO5mOgsGoqg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_Jsq+k+JDsm=3cX6UeRCyD4k1YnWxbkoYm49GMO5mOgsGoqg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Andreas Klinger <ak@it-klinger.de>, Mark Rutland <mark.rutland@arm.com>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald <pmeerw@pmeerw.net>, Song Qiang <songqiang1304521@gmail.com>, Mathieu Othacehe <m.othacehe@gmail.com>, "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 9 Apr 2019 16:08:02 -0500
Rob Herring <robh+dt@kernel.org> wrote:

> On Tue, Apr 9, 2019 at 2:11 PM Andreas Klinger <ak@it-klinger.de> wrote:
> >
> > add compatibles for Maxbotix ultrasonic iio sensor types to yaml
> > documentation
> >
> > Signed-off-by: Andreas Klinger <ak@it-klinger.de>
> > ---
> >  .../bindings/iio/proximity/devantech-srf04.yaml    | 25 ++++++++++++++--------
> >  1 file changed, 16 insertions(+), 9 deletions(-)  
> 
> In the future, 'dt-bindings: iio: ...' for the subject please.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied and subject tidied up.

Thanks,

Jonathan
