From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: ACPI vs DT at runtime
Date: Tue, 19 Nov 2013 13:48:44 +0100
Message-ID: <201311191348.44660.arnd@arndb.de>
References: <CAOesGMjKeRb=fFJM0MabDihbEiCGM4EqW9D5i_6-RFxTnpB4Qw@mail.gmail.
 com> <20131118213256.8EC15C401C6@trevor.secretlab.ca>
 <201311182247.03540.david.goodenough@btconnect.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <201311182247.03540.david.goodenough@btconnect.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, David Goodenough <david.goodenough@btconnect.com>, Grant Likely <grant.likely@secretlab.ca>, Jon Masters <jonathan@jonmasters.org>, Olof Johansson <olof@lixom.net>
List-Id: devicetree@vger.kernel.org

On Monday 18 November 2013, David Goodenough wrote:
> Would it not be possible to have ACPI read the hardware configuration
> from the DT, and provide whatever services it wants, while also allowing
> the kernel to retain the DT for its hardware config?  I suppose the only
> thing that would be needed would be some way to mark paricular bits of
> hardware (I am largely thinking of the things lmsensors deals with) as
> being used by ACPI and being off limits to the kernel.

While that may be possible, I don't see what problem that solves. Nobody
has so far explained what problem they want to solve by using ACPI. The
only reason we are discussing this is Jon's statement that "everybody
will use it". For any specific thing you might want to do in ACPI while
leaving the rest in DT, I suspect there is an easier solution in using
just DT.

Since you seem to have something specific in mind, can you elaborate on
why you think lmsensors (or any other device you can think of) would
benefit from ACPI?

	Arnd
