From: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: re: pinctrl: add TB10x pin control driver
Date: Wed, 2 Apr 2014 14:13:58 +0300
Message-ID: <20140402111358.GA23000@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: christian.ruppert-ux6zf3SgZrrQT0dZR+AlfA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Christian Ruppert,

The patch 5aad0db1c1eb: "pinctrl: add TB10x pin control driver" from
Oct 15, 2013, leads to the following static checker warning:

	drivers/pinctrl/pinctrl-tb10x.c:640 tb10x_gpio_request_enable()
	warn: unsigned 'port' is never less than zero.

drivers/pinctrl/pinctrl-tb10x.c
   624          /*
   625           * Figure out to which port the requested GPIO belongs and how to
   626           * configure that port.
   627           * This loop also checks for pin conflicts between GPIOs and other
   628           * functions.
   629           */
   630          for (i = 0; i < state->pinfuncgrpcnt; i++) {
   631                  const struct tb10x_pinfuncgrp *pfg = &state->pingroups[i];
   632                  unsigned int port = pfg->port;
   633                  unsigned int mode = pfg->mode;
   634                  int j;
   635  
   636                  /*
   637                   * Skip pin groups which are always mapped and don't need
   638                   * to be configured.
   639                   */
   640                  if (port < 0)
                            ^^^^^^^^

"pfg->port" is an int so probably "port" should be as well.

   641                          continue;
   642  
   643                  for (j = 0; j < pfg->pincnt; j++) {
   644                          if (pin == pfg->pins[j]) {
   645                                  if (pfg->isgpio) {

regards,
dan carpenter
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
