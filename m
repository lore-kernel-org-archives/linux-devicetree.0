From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3 4/6] usb:common Simplify usb_decode_get_set_descriptor function.
Date: Thu, 31 Jan 2019 14:27:50 +0200
Message-ID: <CAHp75Vd=rpOrVDhG=oALRPFtd-PCgPebQWv5zMKedZnT_9EKqw@mail.gmail.com>
References: <1548935553-452-1-git-send-email-pawell@cadence.com> <1548935553-452-5-git-send-email-pawell@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548935553-452-5-git-send-email-pawell@cadence.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pawel Laszczak <pawell@cadence.com>
Cc: devicetree <devicetree@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, USB <linux-usb@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, "Krogerus, Heikki" <heikki.krogerus@linux.intel.com>, Rob Herring <robh+dt@kernel.org>, rogerq@ti.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, jbergsagel@ti.com, Sekhar Nori <nsekhar@ti.com>, Nishanth Menon <nm@ti.com>, Suresh Punnoose <sureshp@cadence.com>, peter.chen@nxp.com, pjez@cadence.com, kurahul@cadence.com
List-Id: devicetree@vger.kernel.org

On Thu, Jan 31, 2019 at 1:53 PM Pawel Laszczak <pawell@cadence.com> wrote:
>
> Patch moves switch responsible for decoding descriptor type
> outside snprintf. It's little improves code readability.

> +       char *s;

const ?

-- 
With Best Regards,
Andy Shevchenko
