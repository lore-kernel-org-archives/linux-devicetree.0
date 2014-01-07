From: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: re: charger-manager: Modify the way of checking battery's temperature
Date: Tue, 7 Jan 2014 10:39:52 +0300
Message-ID: <20140107073951.GA17969@elgon.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jonghwa3.lee-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Anton Vorontsov <anton-9xeibp6oKSgdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Jonghwa Lee,

The patch 5c49a6256bed: "charger-manager: Modify the way of checking
battery's temperature" from Dec 18, 2013, leads to the following
static checker warning:

	drivers/power/charger-manager.c:563 cm_get_battery_temperature()
	warn: passing casted pointer 'temp' to 'thermal_zone_get_temp()' 32 vs 64.

drivers/power/charger-manager.c
   554  static int cm_get_battery_temperature(struct charger_manager *cm,
   555                                          int *temp)
   556  {
   557          int ret;
   558  
   559          if (!cm->desc->measure_battery_temp)
   560                  return -ENODEV;
   561  
   562  #ifdef CONFIG_THERMAL
   563          ret = thermal_zone_get_temp(cm->tzd_batt, (unsigned long *)temp);
                                                          ^^^^^^^^^^^^^^^^^^^^^^
This will corrupt memory on 64 bit systems.

   564          if (!ret)
   565                  /* Calibrate temperature unit */
   566                  *temp /= 100;
   567  #else
   568          ret = cm->fuel_gauge->get_property(cm->fuel_gauge,
   569                                  POWER_SUPPLY_PROP_TEMP,
   570                                  (union power_supply_propval *)temp);
                                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This will corrupt memory as well.  Some of the callers pass an actual
32 bit integer and not a 64 bit union.

   571  #endif
   572          return ret;
   573  }

regards,
dan carpenter

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
