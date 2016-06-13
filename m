From: ernestovm07@gmail.com
Subject: Re: [PATCH v2 0/6] Introduce Allwinner A33 support
Date: Mon, 13 Jun 2016 12:10:57 -0700 (PDT)
Message-ID: <8a9fe780-30c2-49eb-8158-a5825887c857@googlegroups.com>
References: <1432997706-20172-1-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="----=_Part_319_379902740.1465845057610"
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1432997706-20172-1-git-send-email-hdegoede@redhat.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-sunxi <linux-sunxi@googlegroups.com>
Cc: devicetree@vger.kernel.org, vishnupatekar0510@gmail.com, hdegoede@redhat.com, wens@csie.org, maxime.ripard@free-electrons.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

------=_Part_319_379902740.1465845057610
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

El s=C3=A1bado, 30 de mayo de 2015, 9:55:10 (UTC-5), Hans de Goede escribi=
=C3=B3:
> Hi Maxime,
>=20
> Here is a cleaned up series of Vishnu Patekar's A33 support. This should
> address all concerns raised during the posting of v1.
>=20
> I've tested that all peripherals declared in the shared sun8i-a23-a33.dts=
i
> work on the A33 too, with the exception of the dma-controller. For the
> dma-controller I've compared the A23 vs A33 manual and the entire dma-
> controller description including the register description is bit for bit
> identical.
>=20
> This has been tested on a 7" Ippo Q8H v1.2 A23 tablet, a 7" Ippo Q8H v1.2
> A33 tablet and a 10" GA10H A33 tablet. The dts for the 10" tablet still
> needs some work wrt the lradc button voltages so that is not included
> in this set.
>=20
> Regards,
>=20
> Hans

http://hp7g2.blogspot.com
------=_Part_319_379902740.1465845057610
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

------=_Part_319_379902740.1465845057610--
