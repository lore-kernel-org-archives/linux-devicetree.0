From: Fabio Estevam <festevam@gmail.com>
Subject: Re: Applied "ASoC: pfuze100: Remove leading zero from '@08' notation"
 to the regulator tree
Date: Thu, 26 Oct 2017 12:19:55 -0200
Message-ID: <CAOMZO5BKGG3OdfHo8COxr4LzgjPZWcEK8qr_hjf0pbH6DMmKeA@mail.gmail.com>
References: <1508957833-22231-1-git-send-email-marco.franchi@nxp.com> <20171026141722.C3D1844005B@finisterre.ee.mobilebroadband>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171026141722.C3D1844005B@finisterre.ee.mobilebroadband>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Marco Franchi <marco.franchi@nxp.com>, Liam Girdwood <lgirdwood@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Marco Antonio Franchi <marcofrk@gmail.com>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 26, 2017 at 12:17 PM, Mark Brown <broonie@kernel.org> wrote:
> The patch
>
>    ASoC: pfuze100: Remove leading zero from '@08' notation

This should be 'regulator: pfuze100' instead.
