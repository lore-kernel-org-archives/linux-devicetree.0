From: Dinh Nguyen <dinguyen@altera.com>
Subject: Re: [PATCH 1/2] dt/bindings: add binding for ARM Versatile
 character LCD
Date: Fri, 28 Mar 2014 16:57:27 -0500
Message-ID: <1396043847.27583.3.camel@linux-builds1>
References: <1396041629-28820-1-git-send-email-robherring2@gmail.com>
 <1396042524.27583.0.camel@linux-builds1>
 <CAL_JsqLKti+1WCvt2kAMpic0u1zRtVJ-ZBvp2BasPx847ZDKLQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAL_JsqLKti+1WCvt2kAMpic0u1zRtVJ-ZBvp2BasPx847ZDKLQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robherring2@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kumar Gala <galak@codeaurora.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, 2014-03-28 at 16:48 -0500, Rob Herring wrote:
> On Fri, Mar 28, 2014 at 4:35 PM, Dinh Nguyen <dinguyen@altera.com> wrote:
> > On Fri, 2014-03-28 at 16:20 -0500, Rob Herring wrote:
> >> From: Rob Herring <robh@kernel.org>
> >>
> >> Add binding doc for Versatile platforms character LCD controller
> >> interface.
> >>
> >> Signed-off-by: Rob Herring <robh@kernel.org>
> >> Cc: Pawel Moll <pawel.moll@arm.com>
> >> Cc: Mark Rutland <mark.rutland@arm.com>
> >> Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
> >> Cc: Kumar Gala <galak@codeaurora.org>
> >> ---
> >>  Documentation/devicetree/bindings/misc/arm-charlcd.txt | 18 ++++++++++++++++++
> >>  1 file changed, 18 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/misc/arm-charlcd.txt
> >>
> >> diff --git a/Documentation/devicetree/bindings/misc/arm-charlcd.txt b/Documentation/devicetree/bindings/misc/arm-charlcd.txt
> >> new file mode 100644
> >> index 0000000..e28e2aa
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/misc/arm-charlcd.txt
> >> @@ -0,0 +1,18 @@
> >> +ARM Versatile Character LCD
> >> +-----------------------------------------------------
> >> +This binding defines the character LCD interface found on ARM Versatile AB
> >> +and PB reference platforms.
> >> +
> >> +Required properties:
> >> +- compatible : "arm,versatile-clcd"
> >
> > Should this be "arm,versatile-lcd"?
> 
> Make up your mind. ;) -lcd is what is already used in the dts, but
> since there was no driver support it should be okay to change the dts.
> If we're changing, I think I'll change it to "arm,versatile-char-lcd".
> 'c' alone could just mean color.

Sorry...what I meant was that in your patch, the examples was using
"lcd", and here's its "clcd". Then your 2/2 patch is using "lcd".

Dinh
> 
> Rob
