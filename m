From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Order in "compatibility" DT property ignored by a platform bus
Date: Tue, 2 Jan 2018 10:19:42 +0100
Message-ID: <CACna6ry3iOrqbFqS6EroVhhP3szNgfCQxpe=yx1eHmY2oD3big@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Brian Norris <computersforpeace@gmail.com>
List-Id: devicetree@vger.kernel.org

I was wondering how platform bus handles order of strings in the
"compatibility" property. After reading the code & testing it I
realized it doesn't.

The property should store strings ordered from the most specific to
the most generic. You could expect a more specific string to have a
priority while matching.

In platform_match there isn't any magic code for handling that. It
simply checks if a driver that was passed can support a given device.
I also did 2 quick tests with:
1) compatible =3D "foo", "bar";
2) compatible =3D "bar", "foo";
and it each case a foo platform driver was used. It just happened to
be before bar platform driver on kernel's internal list (both drivers
were built-in).

If you compare this with ARM's setup_machine_fdt you will notice that
one actually looks for the best matching machine code (it's handled
with the __of_match_node).

Am I correct understanding this isn't a proper behavior? Are there any
plans fixing this?
>From what I can see a current design with the "match" callback doesn't
allow such a change, so I guess it'd need to be reworked first? Were
there any efforts regarding that?

--=20
Rafa=C5=82
