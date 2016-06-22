From: Florian Vaussard <florian.vaussard@heig-vd.ch>
Subject: Re: [PATCH 2/3] iio: adc: max1363: Add device tree binding
 documentation
Date: Wed, 22 Jun 2016 08:18:06 +0200
Message-ID: <b48960b5-1965-b2cc-037b-eba4e7bbb7cb@heig-vd.ch>
References: <1466492969-2185-1-git-send-email-florian.vaussard@heig-vd.ch>
 <1466492969-2185-3-git-send-email-florian.vaussard@heig-vd.ch>
 <20160621214951.GA11679@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160621214951.GA11679@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Martin Kepplinger <martink@posteo.de>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

Le 21. 06. 16 =E0 23:49, Rob Herring a =E9crit :
> On Tue, Jun 21, 2016 at 09:09:28AM +0200, Florian Vaussard wrote:
>> Add the device tree documentation for all the supported parts. Manda=
tory
>> binding is the compatible string and the slave I2C address.
>>
>> Optional properties can be used to specify the Vcc / Vref regulators=
, as
>> well as the IRQ line if available.
>>
>> Signed-off-by: Florian Vaussard <florian.vaussard@heig-vd.ch>
>> ---
>>  .../devicetree/bindings/iio/adc/max1363.txt        | 63 +++++++++++=
+++++++++++
>>  1 file changed, 63 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/iio/adc/max136=
3.txt
>=20
> Acked-by: Rob Herring <robh@kernel.org>
>=20

Thanks for the review.

=46lorian
