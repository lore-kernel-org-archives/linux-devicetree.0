From: Wolfgang Grandegger <wg@grandegger.com>
Subject: Re: [PATCH/RFC 2/2] 5200: improve i2c bus error recovery
Date: Tue, 26 Jan 2010 08:33:35 +0100
Message-ID: <4B5E9ACF.7000206@grandegger.com>
References: <1264191502.2224.2@antares> <4B5D4E56.3020902@grandegger.com>
	<1264451219.2315.1@antares>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <1264451219.2315.1@antares>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
To: =?ISO-8859-1?Q?Albrecht_Dre=DF?= <albrecht.dress@arcor.de>
Cc: Linux PPC Development <linuxppc-dev@ozlabs.org>, Devicetree Discussions <devicetree-discuss@lists.ozlabs.org>, "Ben Dooks (embedded platforms)" <ben-linux@fluff.org>
List-Id: devicetree@vger.kernel.org

Albrecht Dre=DF wrote:
> Am 25.01.10 08:55 schrieb(en) Wolfgang Grandegger:
>> Albrecht Dre=DF wrote:
>>> Make the I2C adapter timeout configurable through a Device Tree
>>> property which gives the timeout in microseconds.
>>
>> My understanding is that software properties should not be defined via
>> the device tree. I think a sysfs entry is more appropriate.
> =

> Is the timeout really a /software/ property?  My feeling is that the
> timeout basically depends upon the bus clock and the chips attached to
> the bus.  Therefore, it is linked closer to the composition of the
> board's hardware as described in the device tree, than to any userland
> software.  Or am I totally wrong here?

Well, yes, it seems to be a border case.

Wolfgang.
