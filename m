From: Jamie Iles <jamie@jamieiles.com>
Subject: Re: [PATCHv2 3/3] picoxcell: add the DTS for the PC7302 board
Date: Thu, 1 Sep 2011 08:58:15 +0100
Message-ID: <20110901075815.GA2585@pulham.picochip.com>
References: <1314196906-20709-1-git-send-email-jamie@jamieiles.com>
	<1314196906-20709-4-git-send-email-jamie@jamieiles.com>
	<CAGsJ_4wp8aSJ2Kug2FkAznbVA9ifLfHt95P8+9bUijKAqJj5kA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CAGsJ_4wp8aSJ2Kug2FkAznbVA9ifLfHt95P8+9bUijKAqJj5kA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Barry Song <21cnbao@gmail.com>
Cc: Jamie Iles <jamie@jamieiles.com>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 01, 2011 at 02:36:17PM +0800, Barry Song wrote:
> 2011/8/24 Jamie Iles <jamie@jamieiles.com>:
[...]
> > + =A0 =A0 =A0 clocks {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ref_clk: clock@10 {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "fixed-clo=
ck";
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-outputs =3D "ref";
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-frequency =3D <2000=
0000>;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> =

> ok. find it. is its name just "ref_clk"? could it be a pll/osc or some
> meaningful name?

Well it's the board reference clock.  Typically this is a crystal, but =

can also be an accurate, external reference or a VCTCXO so it didn't =

feel right to encode that into the name for the SoC DTSI.  I guess it =

could be called board_clk if that makes things easier though.

Jamie
